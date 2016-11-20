# Maintainer: Philipp 'TamCore' B. <philipp [at] tamcore [dot] eu>

pkgname=ghostwriter-git
pkgver=v1.4.2.r1.g812199f
pkgrel=1
pkgdesc="ghostwriter is a cross-platform, aesthetic, distraction-free Markdown editor."
arch=(i686 x86_64)
url="https://github.com/wereturtle/ghostwriter"
license=('GPL3')
source=(git://github.com/wereturtle/ghostwriter.git)
sha256sums=('SKIP')
conflicts=('ghostwriter')
provides=('ghostwriter')
makedepends=('git')
depends=('qt5-base' 'qt5-webkit' 'hunspell' 'desktop-file-utils' 'gtk-update-icon-cache' 'markdown')
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
