# vim:ts=2:sw=2:expandtab
# Maintainer: peelz <peelz.dev+arch@gmail.com>

_commit="af3d0e6d9a5f3aa67c1e43ba954ed10ccc7f9063"
pkgname="uwsm"
pkgver="0.20.2"
pkgrel="1"
pkgdesc="A standalone Wayland session manager"
url="https://github.com/Vladimir-csp/uwsm"
arch=("any")
license=("MIT")
depends=(
  "python"
  "python-pyxdg"
  "python-dbus"
)
optdepends=(
  "libnewt: for 'uwsm start select'"
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
