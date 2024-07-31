# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname="tpfanctl"
pkgver=0.1.1
pkgrel=1
pkgdesc="A simple ThinkPad fan control CLI for Linux, written in Rust."
arch=("x86_64")
url="https://github.com/ezntek/tpfanspeed/archive/refs/tags/v${pkgver}.tar.gz"
license=('MPL-2.0')
groups=()
provides=("tpfanctl" "setfan")
conflicts=("tpfanctl" "setfan")
depends=("lm_sensors")
makedepends=("cargo")
source=("${url}")
sha256sums=("312cd45f0a7b8a062bfaf1a00cebb7feccf1fffe13b43630c91d28ddad2787c4")

build() {
    cd "tpfanspeed-${pkgver}"
    cargo build --release --frozen
}


package() {
    cd "tpfanspeed-${pkgver}"
    install -Dm755 "target/release/tpfanctl" "$pkgdir/usr/bin/tpfanctl"
    install -Dm755 "target/release/setfan" "$pkgdir/usr/bin/setfan"
    install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
