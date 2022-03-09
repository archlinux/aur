pkgname='rum'
pkgver=0.7.2
pkgrel=1
pkgdesc='Game library management'
arch=('x86_64')
url='https://johncena141.eu.org:8141/johncena141/rum'
license=('GPL3')
depends=(webkit2gtk curl wget openssl appmenu-gtk-module gtk3 libappindicator-gtk3 libvips udev)
makedepends=(cargo pnpm git squashfs-tools patchelf)
source=("$pkgname-$pkgver.tar.gz::https://johncena141.eu.org:8141/johncena141/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('205e3646bbebe5bfb26bbe3b5fa76855')

build() {
    cd "$srcdir/$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    pnpm install
    pnpm run build
    pnpm run tauri build
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm0755 -t "$pkgdir/usr/bin/" "src-tauri/target/release/$pkgname"
    install -Dm644 ./$pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm644 ./icon.svg "$pkgdir/usr/share/pixmaps/$pkgname.svg"
}

