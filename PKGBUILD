# Maintainer: Will Price <will.price94+aur@gmail.com>

_pkgname=ino
pkgname=${_pkgname}-git
pkgver=20140415
pkgrel=3
pkgdesc="Command line toolkit for working with Arduino hardware. Works with Arduino 1.5"
arch=('any')
url="http://inotool.org/"
license=('MIT')
depends=('arduino'
         'picocom'
         'python2'
         'python2-jinja'
         'python2-pyserial'
         'python2-configobj'
         'python2-ordereddict'
         'python2-configargparse'
         'python-glob2-git'
        )
makedepends=('git'
             'python2-sphinx'
            )
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://github.com/amperka/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git log -1 --format='%cd' --date=short | tr -d -- '-'
}

build() {
    cd "${srcdir}/${_pkgname}"
    make doc
}

package() {
  cd "${srcdir}/${_pkgname}"

  python2 setup.py install --root="$pkgdir/" --optimize=1

  mkdir -p "$pkgdir/usr/share/"{licenses,doc}/${_pkgname}
  cp MIT-LICENSE.txt "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
  cp -R "doc/.build/html/" "$pkgdir/usr/share/doc/${_pkgname}/"
}

