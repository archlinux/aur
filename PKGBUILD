# Maintainer: oi_wtf <brainpower at mailbox dot org>

pkgname=tuxedo-touchpad-switch
pkgver=1.0.7
pkgrel=1
pkgdesc="A Linux userspace driver to enable and disable the touchpads on TongFang/Uniwill laptops"
url="https://github.com/tuxedocomputers/tuxedo-touchpad-switch"
arch=(x86_64)
license=(GPL3)

depends=("glib2")
makedepends=("git" "cmake" "ninja")

provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")

_commit="78f47d6c21429c188a4742f5d39e09767b54f3ae" # tag v1.0.7
#https://github.com/tuxedocomputers/tuxedo-touchpad-switch/archive/v$pkgver/${pkgname}-${pkgver}.tar.gz
source=(
  git+https://github.com/tuxedocomputers/tuxedo-touchpad-switch.git#commit=$_commit
)
sha256sums=(
  SKIP
)

#prepare() {
#  cd "${pkgname}"
#}

build() {
  cd "${pkgname}"

  cmake -B builddir -G Ninja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo

  ninja -C builddir
}

package() {
  cd "${pkgname}"

  DESTDIR="${pkgdir}" ninja -C builddir install
}
