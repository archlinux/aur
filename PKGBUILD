# vim:ts=2:sw=2:expandtab
# Maintainer: peelz <peelz.dev+arch@gmail.com>

_commit="4989c95caa44ef4f109e0820ecc00d6492e0e6c5"
pkgname="uwsm"
pkgver="0.19.1"
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
