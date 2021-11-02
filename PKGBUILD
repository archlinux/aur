# Maintainer: Patrick Desaulniers <desaulniers dot patrick at carrefour dot cegepvicto dot ca>

pkgname=bitrot-git
pkgver=r15.70534bc
pkgrel=1
pkgdesc="Bitrot audio plugins (LV2, VST2 and LADSPA)"
arch=('i686' 'x86_64')
url="https://github.com/grejppi/bitrot.git"
license=('Apache')
depends=('gcc-libs')
makedepends=('git' 'python')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("${pkgname%-*}::git+https://github.com/grejppi/bitrot.git")
md5sums=('SKIP')

pkgver() {
    cd "${pkgname%-*}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${pkgname%-*}"
    git submodule update --init --recursive
    ./waf configure --prefix="/usr" 
}

build() {
    cd "${pkgname%-*}"
    ./waf
}

package() {
    cd "${pkgname%-*}"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    ./waf install --destdir="$pkgdir"
}
