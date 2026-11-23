# Maintainer: Yukari Hafner <shinmera@tymoon.eu>
pkgname=anville
pkgver=v0.2.1+tojiko
pkgrel=1
epoch=0
pkgdesc="Slop-free HTTP server"
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'riscv64')
url="https://github.com/shirakumo/libmixed"
license=('MIT' 'EUPL')
groups=()
options=(!lto)
makedepends=('rust')
source=("https://codeberg.org/sugar700/$pkgname/archive/$pkgver.zip"
        'config.kdl'
        $pkgname'.install'
        $pkgname'.service')
sha1sums=('cce9ece8694c24bf98d080c08534ca020d99cc1e'
          'a7c65eb4813f3ffcd80e68330623cff6cee6ffa8'
          'e9a011594bd13ebff55a1f3273e3c487e5bdd18c'
          'd8f914710626d78595783dc475bbd71f153a8b00')
install=$pkgname.install

build() {
    cd "$pkgname"
    cargo build --release
}

package() {
    install -d $pkgdir'/var/lib/'$pkgname $pkgdir'/etc/'$pkgname $pkgdir'/usr/bin/' $pkgdir'/usr/lib/systemd/system/'
    install -Dm644 'config.kdl' $pkgdir'/etc/'$pkgname
    install -Dm644 $pkgname'/target/release/anville' $pkgdir'/usr/bin/'
    install -Dm644 -T $pkgname'.service' $pkgdir'/usr/lib/systemd/system/'$pkgname'.service'
}
