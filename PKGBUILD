pkgname=asfy-bright
pkgver=0.1.0
pkgrel=1
pkgdesc="Controlador de brillo usando GTK4 y Layer Shell"
arch=('x86_64')
url="https://github.com/HectorAlejandro26/asfy-bright"
license=('MIT')
depends=('gtk4' 'gtk4-layer-shell' 'glibc' 'gcc-libs' 'brightnessctl')
makedepends=('cargo' 'git')
source=("$pkgname::git+$url.git#tag=v$pkgver")
md5sums=('SKIP')
options=('!debug')

build() {
    cd "$pkgname"
    cargo build --release --locked
}

package() {
    cd "$pkgname"
    install -Dm755 "target/release/asfybright" "$pkgdir/usr/bin/asfybright"
    install -Dm644 "systemd/asfy-bright.service" "$pkgdir/usr/lib/systemd/user/asfy-bright.service"
}
