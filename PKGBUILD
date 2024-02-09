# vim:ts=2:sw=2:expandtab
# Maintainer: peelz <peelz.dev+arch@gmail.com>

_commit="5c48a44497ad8df8e1e7c71aebec5a9cbfe413ef"
pkgname="uwsm"
pkgver="0.14.4"
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
