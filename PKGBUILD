# Maintainer: Milan Šťastný <milan@statnej.ch>

pkgname=eam-git
pkgver=1.0.1
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
sha256sums=('1ed2d7e1ff6b8e1ddb7f163bd3eae089a668a3dbe4480bab04567ffa9114b44d'
            '29c00c0e03e20546d3115fbe9294492e5c8ff81af09565aebcb311ade5034dbf')

prepare() {
  cd Epic-Asset-Manager-$pkgver
}

build() {
    cd Epic-Asset-Manager-$pkgver
    cargo build --release --target-dir=target
}

check() {
    cd Epic-Asset-Manager-$pkgver
    cargo test --release --target-dir=target
}

package() {
    install -Dm644 "eam.desktop" "$pkgdir/usr/share/applications/eam.desktop"
    cd Epic-Asset-Manager-$pkgver
    install -TDm 755 target/release/epic_asset_manager "${pkgdir}/usr/bin/eam"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
