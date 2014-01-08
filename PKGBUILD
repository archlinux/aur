# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>

_pkgbase=pjson
pkgname=$_pkgbase-git
pkgver=21.1870aa6
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

  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  # python3 fix
  sed "s/print e/print (e)/" -i $_pkgbase/$_pkgbase/__init__.py

  # arch's pygments is 1.6
  sed "s/JSONLexer/JsonLexer/" -i $_pkgbase/$_pkgbase/__init__.py
  sed "s/Pygments==1.5/Pygments==1.6/" -i $_pkgbase/setup.py
}

package() {
  cd $_pkgbase

  python setup.py install --root="$pkgdir/" --optimize=1

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
