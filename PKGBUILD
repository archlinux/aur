# Maintainer: Sapphira Armageddos <shadowkyogre.public@gmail.com>
# Contributor: Charles Bos <charlesbos1 AT gmail>
# Contributor: Pantelis Panayiotou <p.panayiotou@gmail.com>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: nesl247 <nesl247@gmail.com>
# Contributor: JJDaNiMoTh <jjdanimoth@gmail.com>

_upstream=fusion-icon

pkgname=fusion-icon-git
epoch=1
pkgver=0.2.2.r10.gb6fb51a
pkgrel=1
pkgdesc="Simple tray icon for Compiz 0.8"
arch=('any')
url="http://www.compiz.org/"
license=('GPL')
conflicts=('fusion-icon0.9' 'fusion-icon')
provides=('fusion-icon')
depends=('compizconfig-python' 'hicolor-icon-theme' 'xorg-utils' 'mesa-demos')

# Note to anyone who builds this: Make sure you install the appropriate
# dependencies for the user interfaces you want to use! Otherwise, it'll appear
# like it's not working!
optdepends=(
	'python-pyqt5: For the Qt Interface'
	'python-gobject: For the GTK+ Interface'
	'libappindicator-gtk3: For the GTK+ Interface'
)

install="$pkgname.install"
source=("git+https://github.com/compiz-reloaded/${_upstream}")

pkgver() {
  cd "${srcdir}/${_upstream}"
  git describe --long --tags|sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/${_upstream}"
  # Workaround until upstream autofills out main.py for each interface
  make PREFIX=/usr
  make PREFIX=/usr DESTDIR="$pkgdir" install
}

sha256sums=('SKIP')
