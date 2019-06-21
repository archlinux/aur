# Maintainer: Philipp 'TamCore' B. <philipp [at] tamcore [dot] eu>

pkgname=ghostwriter-git
pkgver=v1.8.0.r0.g78d7f3a
pkgrel=1
pkgdesc="ghostwriter is a cross-platform, aesthetic, distraction-free Markdown editor."
arch=(i686 x86_64)
url="https://github.com/wereturtle/ghostwriter"
license=('GPL3')
source=(git://github.com/wereturtle/ghostwriter.git)
sha256sums=('SKIP')
conflicts=('ghostwriter')
provides=('ghostwriter')
makedepends=('git' 'qt5-tools')
depends=('qt5-base' 'qt5-svg' 'hunspell' 'desktop-file-utils' 
         'gtk-update-icon-cache' 'markdown' 'qt5-webengine')
optdepends=('hunspell: spell checking')

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
