# Maintainer: Drew DeVault <sir@cmpwn.com>
pkgname=knightos-sdk
_pkgname=sdk
pkgver=2.0.10
pkgrel=2
license=('MIT')
pkgdesc='The KnightOS developer SDK'
groups=("knightos")
depends=(
	"python" "python-setuptools" "python-requests" "python-docopt" "genkfs"
	"kpack" "knightos-sass" "z80e" "python-yaml" "python-pystache" "kimg" "knightos-kcc"
	"scas"
)
optdepends=(
	"git: version control support"
	"mercurial: version control support"
)
arch=("any")
url='https://github.com/KnightOS/sdk'
source=("$pkgname-$pkgver.tar.gz::https://github.com/KnightOS/$_pkgname/archive/$pkgver.tar.gz")
sha256sums=('c24e1bc3eb8931918fc79a523d4a5e3476fcf5f05731dd04ed42d766e82f5fd9')

build() {
	cd "$_pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
