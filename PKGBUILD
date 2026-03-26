# Maintainer: gigas002 <gigas002@pm.me>

_pkgname="waysip"
pkgname="${_pkgname}-git"
pkgver=r268.e5836a9
pkgrel=1
pkgdesc="A wayland-native, blazing-fast area selection tool"
arch=("x86_64")
url="https://github.com/waycrate/waysip"
license=('MIT')
depends=(wayland pango cairo glib2)
makedepends=(git cargo)
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("${_pkgname}::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${srcdir}/${_pkgname}"
  cargo build --release
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${_pkgname}"
}
