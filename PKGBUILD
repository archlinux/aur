# Maintainer: fossdd <fossdd@tutanota.com>
pkgname=boa-git
_pkgname=boa
pkgver=v0.11.r103.gbd199677a
pkgrel=1
pkgdesc=" Boa is an embeddable and experimental Javascript engine written in Rust. Currently, it has support for some of the language. "
arch=('i686' 'x86_64')
url="https://github.com/boa-dev/boa"
license=(MIT)
makedepends=('rust' 'git')
source=('git+https://github.com/boa-dev/boa.git')
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

