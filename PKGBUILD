# Maintainer: Will Price <will.price94+aur@gmail.com>

_pkgname=ino
pkgname=${_pkgname}-1.5-git
pkgver=20140415
pkgrel=1
pkgdesc="Command line toolkit for working with Arduino hardware. Works with Arduino 1.5"
arch=('any')
url="http://inotool.org/"
license=('MIT')
depends=('arduino' 'picocom' 'python2-jinja' 'python2-configobj' 'python2-pyserial' 'python2-glob2-git')
makedepends=('python2' 'git' 'python-sphinx')
provides=(${_pkgname})
conflicts=(${_pkgname})
source=('git+https://github.com/justonia/ino.git#branch=ide1.5x')
md5sums=('SKIP')

pkgver() {
  cd ${srcdir}/${_pkgname}
  make doc
  git log -1 --format='%cd' --date=short | tr -d -- '-'
}

package() {
  cd ${srcdir}/${_pkgname}

  python2 setup.py install --root="$pkgdir/" --optimize=1

  mkdir -p "$pkgdir/usr/share/"{licenses,doc}/ino-git
  cp MIT-LICENSE.txt "$pkgdir/usr/share/licenses/ino-git/LICENSE"
  cp -R "doc/.build/html/" "$pkgdir/usr/share/doc/ino-git/"
}

