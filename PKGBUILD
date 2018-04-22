# Maintainer: Ivan Semkin (ivan at semkin dot ru)

appname=Pext
pkgname=pext-git
pkgver=0.14
pkgrel=1
pkgdesc="Python-based extendable tool"
arch=('any')
url="https://pext.hackerchick.me/"
license=('GPL3')
depends=('python-dulwich' 'libnotify' 'python-pip' 'python-pyqt5' 'qt5-quickcontrols')
makedepends=('python-setuptools')
optdepends=('pass: password manager support'
            'ffmpeg: radiobrowser music support'
            'python-opengl: required for correct rendering on some GPUs')
provides=('pext')
conflicts=('pext')
source=('git://github.com/Pext/Pext')
md5sums=('SKIP')

pkgver() {
  cd $appname
  echo "$(git describe | sed 's/^v//; s/-/.r/; s/-g/./')"
}

prepare() {
  sed "s/'pyqt5'//g" -i $srcdir/$appname/setup.py
  sed "s/USE_INTERNAL_UPDATER = .*/USE_INTERNAL_UPDATER = False/" -i $srcdir/$appname/pext/constants.py
}

package() {
  cd "$srcdir/$appname"
  python3 setup.py install --optimize=1 --root="${pkgdir}/"
}
# vim:set ts=2 sw=2 et:
