# vim:ts=2:sw=2:expandtab
# Maintainer: peelz <peelz.dev+arch@gmail.com>

_pkgname="solarxr-cli"
pkgname="solarxr-cli-git"
pkgver="r27.f319d3c"
pkgrel="1"
pkgdesc="A command-line tool for interfacing with the SlimeVR server"
arch=("x86_64")
url="https://github.com/notpeelz/solarxr-cli"
license=("GPL-3.0-or-later")
provides=(
  "solarxr-cli"
  "solarxr-input"
)
conflicts=(
  "solarxr-cli"
  "solarxr-input"
)
makedepends=(
  "git"
  "rust"
)
depends=(
  "openxr"
)
source=(
  "${_pkgname}::git+https://github.com/notpeelz/solarxr-cli.git"
)
sha256sums=(
  "SKIP"
)
backup=(
  "etc/xdg/solarxr-input/config.json"
)
options+=(!lto)

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  git submodule update --init --recursive
}

build() {
  cd "${srcdir}/${_pkgname}"
  cargo make build -- --release
}

package() {
  cd "${srcdir}/${_pkgname}"
  cargo make install "${pkgdir}" -- --release
}
