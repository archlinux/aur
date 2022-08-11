# Maintainer: Otreblan <otreblain@gmail.com>
# Contributor: Teodor Nikolov <teodor.nikolov22@gmail.com>
# Contributor: Younes Khoudli <khoyobegenn@gmail.com>

pkgname=libtree-git
pkgver=2.0.0.r161.g87ea31a
pkgrel=1
pkgdesc="ldd as a tree with an option to bundle dependencies into a single folder "
arch=('x86_64')
url="https://github.com/haampie/libtree"
license=('MIT')
depends=('gcc-libs')
makedepends=('git')
optdepends=()
checkdepends=()
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"

    ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/^v-\?//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
    cd "${pkgname%-git}" || exit 1

    make
}

check() {
    cd "${pkgname%-git}" || exit 1

    make check
}

package() {
    cd "${pkgname%-git}" || exit 1

    make PREFIX="$pkgdir/usr" install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"
}
