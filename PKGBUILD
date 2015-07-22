# Maintainer: mirandir <mirandir@orange.fr>

pkgname=joystickwake-git
_realname=joystickwake
pkgver=e55e11f
pkgrel=2
pkgdesc="Joystick-aware screen waker. This program attempts to prevent screen blankers from activating while joysticks and other game controllers are in use."
arch=('any')
url=('https://github.com/foresto/joystickwake')
license=('MIT')
depends=('python-pyudev' 'python-xlib')
makedepends=('git' 'python-docutils' 'gzip')
source=(joystickwake::git+https://github.com/foresto/joystickwake)
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_realname}"
  git describe --always | sed 's|-|.|g'
}

package() {
   cd $srcdir/$_realname
   python setup.py install --prefix=/usr --root=$pkgdir
   # manpage
   install -d $pkgdir/usr/share/man/man1
   rst2man README.rst joystickwake.1
   gzip joystickwake.1
   mv joystickwake.1.gz $pkgdir/usr/share/man/man1
}

