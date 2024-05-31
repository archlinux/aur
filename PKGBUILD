# Maintainer: oi_wtf <brainpower at mailbox dot org>

pkgname=tuxedo-touchpad-switch
pkgver=1.0.8
pkgrel=1
pkgdesc="A Linux userspace driver to enable and disable the touchpads on TongFang/Uniwill laptops"
url="https://github.com/tuxedocomputers/tuxedo-touchpad-switch"
arch=(x86_64)
license=(GPL-3.0-or-later)

depends=("glib2")
makedepends=("git" "cmake" "ninja")

provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")

_commit="9c7982fb2732561db3540a8fe96431cd55b9b707" # tag v1.0.8
#https://github.com/tuxedocomputers/tuxedo-touchpad-switch/archive/v$pkgver/${pkgname}-${pkgver}.tar.gz
source=(
  git+https://github.com/tuxedocomputers/tuxedo-touchpad-switch.git#commit=$_commit
)
sha256sums=('b02f66567ad2e913c54cc062eac3abcda65986893b53c43d37aed4e7bdd3022b')

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
