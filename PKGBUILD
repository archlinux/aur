# Maintainer: Bidossessi Sodonon

pkgname=trelby-git
_pkgname=trelby
pkgver=0.r809.580222d
pkgrel=1
pkgdesc="Free screenwriting application"
url=http://www.trelby.org
arch=('any')
license=(GPL3)
provides=("$_pkgname")
depends=(
    'python2'
    'python2-setuptools'
    'python2-lxml'
    'wxpython'
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
  gzip -c names.txt > names.txt.gz
  gzip -c dict_en.dat > dict_en.dat.gz
  python2 setup.py sdist

  python2 setup.py install --root="${pkgdir}"
  mkdir ${pkgdir}/usr/share/applications -p
  install -Dm 644 trelby.desktop ${pkgdir}/usr/share/applications/trelby.desktop
  mkdir ${pkgdir}/usr/share/trelby/resources -p
  install -Dm 644 resources/icon256.png ${pkgdir}/usr/share/trelby/resources/icon256.png
  mkdir ${pkgdir}/usr/bin -p
  install -Dm 755 ${pkgdir}/opt/trelby/bin/trelby ${pkgdir}/usr/bin/trelby
}
