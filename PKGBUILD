# Maintainer: hashworks <hashworks@archlinux.org>
pkgname=chatblade
pkgdesc="A CLI Swiss Army Knife for ChatGPT"
pkgver=0.3.0
pkgrel=1
arch=("any")
url="https://github.com/npiv/chatblade"
license=("GPL3")
# https://github.com/npiv/chatblade/blob/main/requirements.txt
depends=(
	"python"
	"python-importlib-metadata"
	"python-setuptools"
	"python-aiohttp"
	"python-aiosignal"
	"python-async-timeout"
	"python-attrs"
	"python-certifi"
	"python-charset-normalizer"
	"python-frozenlist"
	"python-idna"
	"python-markdown-it-py"
	"python-mdurl"
	"python-multidict"
	"python-openai"
	"python-pygments"
	"python-yaml"
	"python-regex"
	"python-requests"
	"python-rich"
	"python-tiktoken"
	"python-tqdm"
	"python-urllib3"
	"python-yarl"
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ff54abdab82231630027febe3a67fa94a9bd323ccc520a45036c31a065271d09')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	# Use remote assets
	sed -i 's#<img src="assets/\([^"]*\)">#<img src="'${url}'/raw/v'${pkgver}'/assets/\1">#g' README.md
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	python setup.py install --root="${pkgdir}" -O1 --skip-build
}
