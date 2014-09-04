# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=pjson-git
pkgver=0.6.r41.ge31d735
pkgrel=1
pkgdesc="Command-line tool to validate and pretty-print JSON and XML (development version)"
url="http://igorgue.com/pjson"
arch=('any')
license=('MIT')
depends=('python' 'python-pygments' 'python-xmlformatter')
conflicts=('pjson')
provides=('pjson')
source=("git+https://github.com/igorgue/pjson.git")
md5sums=('SKIP')

pkgver() {
  cd pjson

  _ver=$(grep __version__ pjson/__init__.py | sed 's|[^0-9\.]||g')
  printf "%s.r%s.g%s" "$_ver" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd pjson

  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
