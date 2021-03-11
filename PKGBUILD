# Maintainer: Gennadiy Mykhailiuta <gmykhailiuta@gmail.com>

pkgname=ktrl-git
pkgver=r165.55f7697
pkgrel=1
pkgdesc='Keyboard programming daemon'
url='https://github.com/ItayGarin/ktrl'
arch=('x86_64')
license=('GPL3')
provides=('ktrl')
depends=()
makedepends=('git' 'rust')
source=("${pkgname}::git+https://github.com/ItayGarin/ktrl.git")
sha1sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    (
        set -o pipefail
        git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

prepare() {
    cd "${pkgname}"
}

build() {
    cd "${pkgname}"
    cargo build --release
}

package() {
    cd "${pkgname}/target/release"
    install -Dm755 "ktrl" "$pkgdir/usr/bin/ktrl"
    install -Dm644 "../../LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
