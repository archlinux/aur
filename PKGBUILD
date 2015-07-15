pkgname=radare2-bindings-git
pkgver=20150705.507.d02e5b9
pkgrel=1
pkgdesc="Language bindings for radare2 (git version)"
arch=('i686' 'x86_64')
url="https://radare.org"
license=('LGPL')
depends=('radare2')
makedepends=('git' 'valabind' 'radare2')
provides=('radare2-bindings')
conflicts=('radare2-bindings')

source=("$pkgname"::"git://github.com/radare/radare2-bindings.git")
md5sums=('SKIP')

pkgver () {
  cd "${srcdir}/${pkgname}"
  _date=`date +"%Y%m%d"`
  echo "$_date.$(git rev-list --count master).$(git rev-parse --short master)"
}


build() {
  cd "${srcdir}/${pkgname}"
  (cd r2pipe/python && python setup.py build)
}

package() {
  cd "${srcdir}/${pkgname}"
  (cd r2pipe/python && python setup.py install --root "${pkgdir}")
}

# vim:set ts=2 sw=2 et:
