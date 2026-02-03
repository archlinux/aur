pkgname=hdas
pkgver=1.2.1
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
sha256sums=('78b6e8cbc38faed711f64f57362ec37a523c6c448acece0f2fb87ae9c0978d95')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/hdas" "$pkgdir/usr/bin/hdas"
    install -Dm644 "hdas@.service" "$pkgdir/usr/lib/systemd/system/hdas@.service"
}
