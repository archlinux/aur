# Maintainer: Bidossessi Sodonon

pkgname=trelby-git
_pkgname=trelby
pkgver=0.r806.a29e8bb
pkgrel=1
pkgdesc="Free screenwriting application"
url=http://www.trelby.org
arch=('any')
license=(GPL3)
provides=("$_pkgname")
depends=(
    'python2'
    'python2-lxml'
    'wxpython2.8'
)
source=("$_pkgname"::'git://github.com/oskusalerma/trelby.git')
md5sums=('SKIP')
pkgver() {
  cd "$srcdir/$_pkgname"
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package()
{
  cd ${srcdir}/${_pkgname}
  # Force package data inclusion
  python2 setup.py install --root="${pkgdir}"
  mkdir ${pkgdir}/usr/share/applications/ -p
  install -Dm 644 trelby.desktop ${pkgdir}/usr/share/applications/trelby.desktop
}
