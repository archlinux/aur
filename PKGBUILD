# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=bionic_translation
pkgver=r121.ee37eb21
pkgrel=1
_commit=ee37eb21c91409fe0eed833d0a5a0aa6b931bb7b
pkgdesc='A set of libraries for loading bionic-linked .so files on musl/glibc'
url='https://gitlab.com/android_translation_layer/bionic_translation'
arch=(x86_64 aarch64 armv7h)
license=('MIT')
depends=(
  bubblewrap
  glibc
  libbsd
  libglvnd
  libunwind
)
makedepends=(
  elfutils
  mesa
  meson
)
source=("${pkgname}-${_commit}.tar.gz::${url}/-/archive/$_commit/${pkgname}-${_commit}.tar.gz")
sha256sums=('b1b2fa762485c1f33e71c0de6a4cbf4ca7006cfaec9c4c9cc20949393cbf49ef')

prepare() {
  meson subprojects download --sourcedir="${pkgname}-${_commit}"
}

build() {
  arch-meson "${pkgname}-${_commit}" build
  meson compile -C build
}

# check() {
#   meson test --no-rebuild --print-errorlogs -C build
# }

package() {
  meson install --no-rebuild -C build --destdir "${pkgdir}"
}
