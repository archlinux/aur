# Maintainer: MoribundMurdoch <moribundmurdoch@gmail.com>

pkgname=morconcat
pkgver=0.1.0
pkgrel=1
pkgdesc="A blazing-fast generic file concatenator"
arch=('x86_64')
url="https://github.com/MoribundMurdoch/morconcat"
license=('Unlicense')

depends=(
    'glibc'
    'wayland'
)

makedepends=(
    'cargo'
    'desktop-file-utils'
)

source=(
    "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
)

sha256sums=(
    '763aa51eb426f773755b760dd3e128d4eae56bd8d10886f390e405b234b0dc82'
)

build() {
    cd "$srcdir/$pkgname-$pkgver"

    cargo build --release --locked
}

check() {
    cd "$srcdir/$pkgname-$pkgver"

    cargo test --release --locked
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    install -Dm755 \
        target/release/morconcat \
        "$pkgdir/usr/bin/morconcat"

    install -Dm644 \
        packaging/arch/morconcat.desktop \
        "$pkgdir/usr/share/applications/morconcat.desktop"

    install -Dm644 \
        assets/morconcat.png \
        "$pkgdir/usr/share/pixmaps/morconcat.png"

    install -Dm644 \
        LICENSE.md \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}