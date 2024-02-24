# vim:ts=2:sw=2:expandtab
# Maintainer: peelz <peelz.dev+arch@gmail.com>

_commit="1e45174ef52dc0066a66c578aad9106815011be3"
pkgname="uwsm"
pkgver="0.15.1"
pkgrel="1"
pkgdesc="A standalone Wayland session manager"
url="https://github.com/Vladimir-csp/uwsm"
arch=("any")
license=("MIT")
depends=(
  "python"
  "libnewt" # whiptail
  "python-pyxdg"
  "python-dbus"
)
makedepends=(
  "git"
  "meson"
)
source=(
  "${pkgname}::git+https://github.com/Vladimir-csp/uwsm.git#commit=${_commit}"
)
sha256sums=(
  "SKIP"
)

build() {
  cd "${srcdir}/${pkgname}"
  arch-meson build
}

package() {
  cd "${srcdir}/${pkgname}"
  meson install -C build --destdir "${pkgdir}"
  python3 -m compileall -fq \
    -s "${pkgdir}" \
    "${pkgdir}/usr/share/uwsm/modules"
}
