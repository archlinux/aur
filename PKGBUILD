# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: AdriÃ  Arrufat <swiftscythe@gmail.com>
# Contributor: Marcel Pfeiffer <pfeiffer.marcel@gmx.de>

pkgname=konstruktor-git
pkgver=0.9.0.beta1.r78.g67ef13e
pkgrel=2
pkgdesc="A LDraw-based virtual LEGO(r) CAD for KDE 5."
arch=('i686' 'x86_64')
url="http://opendesktop.org/content/show.php?content=138138"
depends=('kdebase-runtime' 'qt5-base' 'glu' 'povray' 'ldraw-parts-library')
makedepends=('cmake' 'automoc4' 'git' 'qt5-tools')
license=('GPL')
provides=('konstruktor')
conflicts=('konstruktor')
install="$pkgname.install"
source=("$pkgname::git+https://github.com/segfault87/Konstruktor.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed -r 's,([^-]*-g),r\1,;s,-,.,g'
}

build() {
  cd $pkgname
  cmake -DCMAKE_INSTALL_PREFIX='/usr'
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
