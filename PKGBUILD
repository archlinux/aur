# Maintainer: KikooDX <kikoodx@paranoici.org>

_pkgname=kble
pkgname="${_pkgname}-git"
pkgver=r46.a0528de
pkgrel=1
pkgdesc='A keyboard driven level editor for tile based 2D games. Aims for efficiency and simplicity.'
arch=(x86_64)
url="https://git.sr.ht/~kikoodx/${_pkgname}"
license=(MIT)
depends=(raylib)
makedepends=(git zig raylib)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}")
sha256sums=(SKIP)

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_pkgname}"
  zig build -Drelease-small
}

package() {
  cd "${_pkgname}"
  install -Dm 0755 -t "${pkgdir}/usr/bin" "zig-cache/bin/${_pkgname}"
  install -Dm 0644 -t "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE" "LICENSE"
}

# vim: ts=2 sw=2 ft=sh syn=sh et:
