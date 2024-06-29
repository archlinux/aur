# vim:ts=2:sw=2:expandtab
# Maintainer: peelz <peelz.dev+arch@gmail.com>

_commit="2a6b7e0b8f974fa897a8b8edc82c498d838016ca"
pkgname="uwsm"
pkgver="0.16.0"
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
  "scdoc"
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
