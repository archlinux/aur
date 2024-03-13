# vim:ts=2:sw=2:expandtab
# Maintainer: peelz <peelz.dev+arch@gmail.com>

_commit="e7db47c510fb66243d63c677ed7010f5d0e20744"
pkgname="sd-inhibit-bridge"
pkgver="0.1.0"
pkgrel="1"
pkgdesc="A daemon implementing the Idle Inhibition D-Bus API that forwards inhibitor locks to systemd-logind"
url="https://github.com/notpeelz/sd-inhibit-bridge"
arch=("x86_64")
license=("GPL-3.0-or-later")
depends=(
  "systemd"
)
makedepends=(
  "git"
  "meson"
)
source=(
  "${pkgname}::git+https://github.com/notpeelz/sd-inhibit-bridge.git#commit=${_commit}"
)
sha256sums=(
  "SKIP"
)

build() {
  cd "${srcdir}/${pkgname}"
  arch-meson build \
    -Dsystemd-user-service=enabled
}

package() {
  cd "${srcdir}/${pkgname}"
  meson install -C build --destdir "${pkgdir}"
}
