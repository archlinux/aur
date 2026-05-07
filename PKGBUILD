# Maintainer:
# Contributor: codepunk <codepunk AT noreply DOT codeberg DOT org>

pkgname=scratsh
pkgver=0.8.1
pkgrel=1
pkgdesc="Minimal CLI scratch file manager"
archive=scratsh
arch=('x86_64')
url="https://codeberg.org/codepunk/${archive}"
license=('AGPL-3.0-or-later')
depends=()
makedepends=('zig')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('SKIP')

prepare() {
    cd "${archive}"
    # no dependencies
}

build() {
    cd "${archive}"
    zig build \
        -Doptimize=ReleaseSmall
}

check() {
    cd "${archive}"
    zig test src/main.zig
    zig test src/scratchdir.zig
    zig test src/scratchfile.zig
}

package() {
    cd "${archive}"
    install -Dm0755 -t "${pkgdir}/usr/bin" "zig-out/bin/${pkgname}"
}
