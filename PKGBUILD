pkgname=asfy-vol
pkgver=0.1.1
pkgrel=1
pkgdesc="Controlador de volumen usando GTK4 y Layer Shell"
arch=('x86_64')
url="https://github.com/HectorAlejandro26/asfy-vol"
license=('MIT')
depends=('wireplumber' 'gtk4' 'gtk4-layer-shell' 'glibc' 'gcc-libs')
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
    install -Dm755 "target/release/asfyvol" "$pkgdir/usr/bin/asfyvol"
    install -Dm644 "systemd/asfy-vol.service" "$pkgdir/usr/lib/systemd/user/asfy-vol.service"
}
