# vim:ts=2:sw=2:expandtab
# Maintainer: peelz <peelz.dev+arch@gmail.com>

_commit="bd912e4ecc0b8227c3c2a664f41aff7640952e38"
pkgname="uwsm"
pkgver="0.14.1"
pkgrel=1
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

prepare() {
  cd "${srcdir}/${pkgname}"
}

build() {
  cd "${srcdir}/${pkgbase}"
  meson setup --prefix=/usr build
}

package() {
  cd "${srcdir}/${pkgbase}"
  meson install -C build --destdir "${pkgdir}"
  python3 -m compileall -fq \
    -s "${pkgdir}" \
    "${pkgdir}/usr/share/uwsm/modules"
}
