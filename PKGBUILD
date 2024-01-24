# Maintainer: taotieren <admin@taotieren.com>

pkgname=sunxi-fw-git
pkgver=r21.a768b73
pkgrel=5
pkgdesc="Allwinner firmware images decoding and extraction tool"
arch=(aarch64
    x86_64
    riscv64)
url="https://github.com/apritzel/sunxi-fw"
license=(GPL-2.0-only)
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
replaces=()
depends=(dtc
  glibc)
makedepends=(git)
backup=()
options=()
install=
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
#     git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare()
{
    git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
    cd "${srcdir}/${pkgname}"
    make
}

package() {
    cd "${srcdir}/${pkgname}"
    PREFIX="$pkgdir/usr" make install
}
