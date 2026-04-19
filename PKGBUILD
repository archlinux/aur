# Maintainer: gigas002 <gigas002@pm.me>

_pkgname="waysip"
pkgname="${_pkgname}-git"
pkgver=r290.2b8e9cc
pkgrel=2
pkgdesc="A wayland-native, blazing-fast area selection tool"
arch=('x86_64')
url="https://github.com/waycrate/waysip"
license=('MIT')
depends=(wayland pango cairo glib2)
makedepends=(git cargo pkg-config)
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "${_pkgname}"
  cargo build --release --all-features
}

package() {
  cd "${_pkgname}"
  install -Dm0755 -t "${pkgdir}/usr/bin/" "target/release/${_pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
