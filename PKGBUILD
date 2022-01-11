# Maintainer: Ilya Zlobintsev <ilya.zl@protonmail.com>
pkgname=lact
pkgver=0.1.1
pkgrel=2
license=("MIT")
pkgdesc="AMDGPU Controller application"
url="https://github.com/ilyazzz/LACT"
makedepends=("rust")
depends=("gtk3" "hwdata")
arch=('x86_64' 'aarch64')
backup=('etc/lact.json')
source=(
	"${pkgname}-${pkgver}.tar.gz::https://github.com/ilyazzz/LACT/archive/refs/tags/v${pkgver}.tar.gz" 
	"lactd.service" 
	"lact.desktop")
sha256sums=('65dfd9836444a57fc2e330322f114242a4e79c98ea0d259269f2d8af2c308c3c'
            '86f9f94f7f3f5b0f65710daf0701075836683a34245efee2d730b259bda30c67'
            '427a4ac2dc863af74bdb0bfa3514e20586de8872d3939cd2454ce7f1663fc21b')

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
