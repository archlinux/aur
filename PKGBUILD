# vim:ts=2:sw=2:expandtab
# Maintainer: peelz <peelz.dev+arch@gmail.com>

_commit="56cf0082b5f4340805f04e100810ee1d2bfa966d"
pkgname="uwsm"
pkgver="0.20.1"
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
