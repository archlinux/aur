# Maintainer: Ilya Zlobintsev <ilya.zl@protonmail.com>
pkgname=lact
pkgver=0.1
pkgrel=1
license=("MIT")
pkgdesc="AMDGPU Controller application"
url="https://github.com/ilyazzz/LACT"
makedepends=("rust")
depends=("gtk3" "hwids")
arch=("any")
backup=('etc/lact.json')
source=(
	"${pkgname}-${pkgver}.tar.gz::https://github.com/ilyazzz/LACT/archive/refs/tags/v${pkgver}.tar.gz" 
	"lactd.service" 
	"lact.desktop")
sha256sums=(
	"eefd3d2b04e24886ec6411fcabb6cacdaa1ebab5b4279dc91abe8bce85f08916"
	"a03d7ac86236e13ec415ba4ea4dafeb678ef3b44d8eb35c2d0260d5bc570eb6f"
	"427a4ac2dc863af74bdb0bfa3514e20586de8872d3939cd2454ce7f1663fc21b")

build() {
    cd LACT-${pkgver}
    cargo build --release 
}

package() {
    install -Dm644 lactd.service "${pkgdir}"/usr/lib/systemd/system/lactd.service
    install -Dm644 lact.desktop "${pkgdir}"/usr/share/applications/lact.desktop
    cd LACT-${pkgver}
    install -Dm755 target/release/daemon "${pkgdir}"/usr/bin/lact-daemon
    install -Dm755 target/release/cli "${pkgdir}"/usr/bin/lact-cli
    install -Dm755 target/release/gui "${pkgdir}"/usr/bin/lact-gui
}
