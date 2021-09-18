# Maintainer: Giuseppe Calà <gcala at mailbox dot org>

pkgname=kdeltachat-git
pkgver=r176.40092aa
pkgrel=1
pkgdesc="KDeltaChat is a Delta Chat client using Kirigami framework"
arch=(x86_64 aarch64)
url="https://git.sr.ht/~link2xt/kdeltachat"
license=(GPL3)
depends=('kirigami2' 'libdeltachat-git')
makedepends=('git')
provides=('kdeltachat')
conflicts=('kdeltachat')
source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${pkgname%-git}"
  cmake -DCMAKE_INSTALL_PREFIX=/usr -B build
  make -C build
}

package() {
  cd "${pkgname%-git}"
  make -C build DESTDIR="${pkgdir}" PREFIX=/usr install
}
