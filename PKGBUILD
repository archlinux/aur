pkgname="ata-git"
pkgver=r2.3ac8785
pkgrel=1
pkgdesc="Ask the Terminal Anything"
arch=('x86_64')
url="https://github.com/rikhuijzer/ata"
makedepends=('cargo')
source=(
    "git+https://github.com/rikhuijzer/ata.git"
)
md5sums=('SKIP')
conflicts=(
    ata
    ata-bin
)

pkgver() {
  cd "${_pkgname}"
  set -o pipefail
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd $srcdir/ata
    cargo build --release
}

package() {
    install -D $srcdir/ata/target/release/ata $pkgdir/usr/bin/ata
}
