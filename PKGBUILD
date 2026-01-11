pkgname=hdas
pkgver=1.2.0
pkgrel=1
pkgdesc="Track which packages create files in your home directory using eBPF"
arch=('x86_64')
url="https://github.com/adelmonte/hdas"
license=('GPL-3.0-only')
depends=('libbpf')
makedepends=('rust' 'clang')
options=(!lto)
install=hdas.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('fd54162c045849293d1747911ed5806039cb28d96484cd3d224f6b5ec11d3a6c')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/hdas" "$pkgdir/usr/bin/hdas"
    install -Dm644 "hdas@.service" "$pkgdir/usr/lib/systemd/system/hdas@.service"
}
