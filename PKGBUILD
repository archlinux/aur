# Maintainer: Milan Šťastný <milan@statnej.ch>

pkgname=eam-git
pkgver=1.0.4
pkgrel=1
pkgdesc='Epic Asset Manager used to manage assets from Epic Games Store'
url='https://github.com/AchetaGames/Epic-Asset-Manager'
license=(MIT)
arch=(x86_64)
makedepends=(cargo rust gtk3 libsoup webkit2gtk)
conflicts=(eam)
provides=(eam)
source=("${url}/archive/refs/tags/${pkgver}.tar.gz"
	"eam.desktop")
sha256sums=('2e3da45a94d6d28d1820edf0f60d25a6bfc6811b5495d75b1241a7eaf9b0a7e1'
            '29c00c0e03e20546d3115fbe9294492e5c8ff81af09565aebcb311ade5034dbf')

prepare() {
  cd Epic-Asset-Manager-$pkgver
}

build() {
    cd Epic-Asset-Manager-$pkgver
    cargo +stable build --release --target-dir=target
}

check() {
    cd Epic-Asset-Manager-$pkgver
    cargo +stable test --release --target-dir=target
}

package() {
    install -Dm644 "eam.desktop" "$pkgdir/usr/share/applications/eam.desktop"
    cd Epic-Asset-Manager-$pkgver
    install -TDm 755 target/release/epic_asset_manager "${pkgdir}/usr/bin/eam"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
