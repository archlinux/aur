# Maintainer: neXyon <https://aur.archlinux.org/account/nexyon>

_pkgname=lute-v3
pkgname=python-lute3
pkgver=3.10.1
pkgrel=1
pkgdesc="A Python/Flask tool for learning foreign languages through reading."
arch=('any')
url='https://github.com/LuteOrg/lute-v3'
license=('MIT')
depends=(python python-flask python-waitress python-sqlalchemy python-flask-sqlalchemy python-natto python-jaconv python-ahocorapy python-flask-wtf python-xmltodict python-pypdf python-platformdirs python-requests python-beautifulsoup4 python-yaml python-toml python-openepub python-pyparsing python-pypdf python-subtitle-parser)
makedepends=(python-flit-core python-pip)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
	"git+https://github.com/LuteOrg/lute-language-defs")
sha256sums=('796fb4f3c82b4deea4aaf3776a9cb3ea0de12a3f321e1f49766e2c9e05e66844' 'SKIP')

build() {
  rm -rf "$_pkgname-$pkgver/lute/db/language_defs"
  cp -r lute-language-defs "$_pkgname-$pkgver/lute/db/language_defs"
  cd "$_pkgname-$pkgver"
  #python -m pip install build
  python -m build -n
}

package() {
  cd "$_pkgname-$pkgver"
  #python setup.py install --optimize=1 --root="${pkgdir}/"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

