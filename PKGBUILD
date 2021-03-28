# Maintainer: fossdd <fossdd@tutanota.com>
pkgname=sapling-git
_pkgname=sapling
pkgver=r358.04acf19
pkgrel=1
pkgdesc="A highly experimental vi-inspired editor where you edit code, not text."
arch=('i686' 'x86_64')
url="https://github.com/kneasle/sapling"
license=(MIT)
makedepends=('rust' 'git')
source=('git+https://github.com/kneasle/sapling.git')
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd ${_pkgname}
  cargo build --release
}

package() {
  cd ${_pkgname}
  install -Dm755 target/release/${_pkgname} -t "${pkgdir}"/usr/bin/
}

