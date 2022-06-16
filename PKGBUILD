# Maintainer: robertfoster

pkgname=whatsie-git
pkgver=4.3.r207.3dae93a
pkgrel=1
pkgdesc="Fast Light weight WhatsApp Client based on Qt's WebEngine, With lots of settings and packed goodies"
arch=('armv6h' 'armv7h' 'arm' 'aarch64' 'i686' 'x86_64')
url="https://github.com/keshavbhatt/whatsie"
license=('MIT')
depends=('qt5-base' 'qt5-declarative' 'qt5-location' 'qt5-webchannel' 'qt5-webengine')
makedepends=('git' 'qt5-base')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=("${pkgname%-git}::git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"

  printf "%s.r%s.%s" "$(git describe --tags)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname%-git}"
  qmake src
  make
}

package() {
  cd "${pkgname%-git}"
  make INSTALL_ROOT="${pkgdir}" install
}
