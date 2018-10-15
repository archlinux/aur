# Maintainer: Ethan Rakoff <ethan@ethanrakoff.com>

pkgname=threemawebqt-git
pkgver=r2.079de78
pkgrel=1
pkgdesc="Thin client for Threema Web, an E2E encrypted messaging app."
arch=('i686' 'x86_64')
url="https://github.com/ethanrakoff/${pkgname%-*}"
license=('MIT')
depends=('qt5-base' 'qt5-webengine')
makedepends=('git')
source=("git+${url}")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-*}"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" 
}

build() {
  cd "${pkgname%-*}"

  qmake "PREFIX=/usr"
  make
}

package() {
  cd "${pkgname%-*}"

  make INSTALL_ROOT="${pkgdir}" install 

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname%-*}/LICENSE"
}
