pkgname='rum'
pkgver=0.7.0
pkgrel=1
pkgdesc='Game library management'
arch=('x86_64')
url='https://johncena141.eu.org:8141/johncena141/rum'
license=('GPL3')
depends=(webkit2gtk curl wget openssl appmenu-gtk-module gtk3 libappindicator-gtk3 libvips udev)
makedepends=(cargo npm git squashfs-tools patchelf)
source=("$pkgname-$pkgver.tar.gz::https://johncena141.eu.org:8141/johncena141/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('2240ce03f07e8a8001fc17c498914216')

build() {
    cd "$srcdir/$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    npm install
    npm run build
    npm run tauri build
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm0755 -t "$pkgdir/usr/bin/" "src-tauri/target/release/$pkgname"
    install -Dm644 ./$pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm644 ./icon.svg "$pkgdir/usr/share/pixmaps/$pkgname.svg"
}

