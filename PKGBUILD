# Maintainer: Solomon Choina <shlomochoina@gmail.com>
# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org>
# Contributor: Philipp 'TamCore' B. <philipp [at] tamcore [dot] eu>

pkgname=ghostwriter-git
pkgver=2.1.0.r0.g2495f9b
pkgrel=1
pkgdesc="Cross-platform, aesthetic, distraction-free Markdown editor."
arch=(i686 x86_64)
url="https://github.com/wereturtle/ghostwriter"
license=('GPL3')
conflicts=('ghostwriter')
provides=('ghostwriter')
makedepends=('git' 'qt5-tools')
depends=('qt5-base' 'qt5-svg' 'hunspell' 'desktop-file-utils' 
         'gtk-update-icon-cache' 'discount' 'qt5-webengine')
optdepends=('hunspell: spell checking')
source=(git+https://github.com/wereturtle/ghostwriter.git)
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
