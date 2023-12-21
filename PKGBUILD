# Maintainer: taotieren <admin@taotieren.com>

pkgname=sunxi-fw-git
pkgver=r21.1f49133
pkgrel=1
pkgdesc="Allwinner firmware images decoding and extraction tool"
arch=(aarch64
    x86_64
    riscv64)
url="https://github.com/apritzel/sunxi-fw"
license=(GPL2)
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
replaces=()
depends=(dtc
  glibc)
makedepends=(git)
backup=()
options=('!strip')
install=
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
#     git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd "${srcdir}/${pkgname}"
    make
}

package() {
    cd "${srcdir}/${pkgname}"
    PREFIX="$pkgdir/usr" make install
}
