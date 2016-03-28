# Maintainer: Philipp 'TamCore' B. <philipp [at] tamcore [dot] eu>

pkgname=ghostwriter-git
pkgver=v1.3.1.r19.g49af913
pkgrel=1
pkgdesc="ghostwriter is a cross-platform, aesthetic, distraction-free Markdown editor."
arch=(i686 x86_64)
url="https://github.com/wereturtle/ghostwriter"
license=('GPL3')
source=(git://github.com/wereturtle/ghostwriter.git)
sha256sums=('SKIP')
conflicts=('ghostwriter')
provides=('ghostwriter')
makedepends=('git' 'qtchooser')
depends=('qt5-base' 'qt5-webkit' 'hunspell' 'desktop-file-utils' 'gtk-update-icon-cache')
install=ghostwriter.install

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname%-git}"
  qmake PREFIX=/usr
  make
}

package() {
  cd "${pkgname%-git}"
  make INSTALL_ROOT="$pkgdir/" install
}
