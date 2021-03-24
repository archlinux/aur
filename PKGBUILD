# Maintainer: Techcable <Techcable@techcable.net>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Tetsumi <tetsumi@vmail.me>

pkgname=wren
pkgver=0.3.0
pkgrel=1
pkgdesc='Small, fast, class-based concurrent scripting language. '
makedepends=('python3')
depends=('libuv')
license=('MIT')
arch=('x86_64')
url='https://wren.io/'
source=("wren-$pkgver.tar.gz::https://github.com/wren-lang/wren/archive/refs/tags/${pkgver}.tar.gz"
        "wren-cli-$pkgver.tar.gz::https://github.com/wren-lang/wren-cli/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('c566422b52a18693f57b15ae4c9459604e426ea64eddb5fbf2844d8781aa4eb7'
            'a498d2ccb9a723e7163b4530efbaec389cc13e6baaf935e16cbd052a739b7265')

build() {
    make -C "${srcdir}/wren-${pkgver}/projects/make"
    make -C "${srcdir}/wren-cli-${pkgver}/projects/make"
}

package() {
    pushd "${srcdir}/wren-${pkgver}"
    install -Dm755 ./bin/wren_test "$pkgdir/usr/bin/wren_test"
    install -Dm644 ./src/include/wren.h "$pkgdir/usr/include/wren.h"
    install -Dm755 ./lib/libwren.so "$pkgdir/usr/lib/libwren.so"
    install -Dm644 ./lib/libwren.a "$pkgdir/usr/lib/libwren.a"
    install -Dm644 ./LICENSE "$pkgdir/usr/share/licenses/wren/LICENSE"

    popd
    pushd "${srcdir}/wren-cli-${pkgver}"

    # NOTE: Rename 'wren_cli' to plain 'wren'
    install -Dm755 ./bin/wren_cli "$pkgdir/usr/bin/wren"
    install -Dm644 ./LICENSE "$pkgdir/usr/share/licenses/wren/cli-LICENSE"
}

