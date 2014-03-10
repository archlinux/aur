# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>

_pkgbase=pjson
pkgname=$_pkgbase-git
pkgver=0.4.r25.g1d6604e
pkgrel=1
pkgdesc="Command-line tool to validate and pretty-print JSON and XML"
url="http://igorgue.com/pjson"
arch=('any')
license=('MIT')
depends=('python' 'python-pygments')
conflicts=("$_pkgbase")
source=($_pkgbase::"git+https://github.com/igorgue/pjson.git")
md5sums=('SKIP')

pkgver() {
  cd $_pkgbase
  _ver=$(grep version setup.py | sed "s|.*version='\(.*\)'.*|\1|")
  printf "%s.r%s.g%s" "$_ver" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd $_pkgbase

  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
