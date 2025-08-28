# Maintainer: oi_wtf <brainpower at mailbox dot org>

pkgname=tuxedo-touchpad-switch
pkgver=1.1.0
pkgrel=1
pkgdesc="A Linux userspace driver to enable and disable the touchpads on TongFang/Uniwill laptops"
url="https://github.com/tuxedocomputers/tuxedo-touchpad-switch"
arch=(x86_64)
license=(GPL-3.0-or-later)

depends=("glib2")
makedepends=("git" "cmake" "ninja")

provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")

#https://github.com/tuxedocomputers/tuxedo-touchpad-switch/archive/v$pkgver/${pkgname}-${pkgver}.tar.gz
#_commit="6f3ee2f9d7e30c575d7e1f4df355856af5289027" # tag v1.0.9
source=(
  git+https://github.com/tuxedocomputers/tuxedo-touchpad-switch.git#tag=v${pkgver}
)
sha256sums=('7dc8b89b36c577c29e8abe0b1905277746ce8e3861006d7630b614aa2cd6becb')

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
