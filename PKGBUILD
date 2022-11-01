# Maintainer: Solomon Choina <shlomochoina@gmail.com>
# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org>
# Contributor: Philipp 'TamCore' B. <philipp [at] tamcore [dot] eu>

pkgname=ghostwriter-git
pkgver=2.1.6.r96.gd773dd6
pkgrel=1
pkgdesc="Cross-platform, aesthetic, distraction-free Markdown editor."
arch=(x86_64 i686 )
url="https://invent.kde.org/office/ghostwriter"
license=('GPL3')
depends=('qt5-base' 'qt5-svg' 'hunspell' 'qt5-webengine' 'sonnet' 'kxmlgui')
makedepends=('git' 'qt5-tools' 'cmake' 'extra-cmake-modules') #'discount'
conflicts=('ghostwriter')
provides=('ghostwriter')
source=("git+https://invent.kde.org/office/ghostwriter.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"
  [[ -d build ]] || mkdir build
}

build() {
  cd "${pkgname%-git}/build"
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "${pkgname%-git}/build"
  make DESTDIR="$pkgdir"  install
}
