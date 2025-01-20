pkgname=file-warden
pkgver=1.0.1
pkgrel=1
install=file-warden.install
pkgdesc="Systemd-managed file monitoring"
arch=('x86_64')
url="https://github.com/AntoninoAdornetto/file-warden"
license=('GPL3')
depends=('libnotify>=0.8.0')
makedepends=('gcc' 'pkg-config' 'git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('c50b55217d8ccab4187ae569d871f180f4199d2c2a04e6089666540704789b37')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    install -Dm644 docs/file-warden.example.service "$pkgdir/usr/lib/systemd/user/file-warden.service"
    install -Dm644 docs/file-warden.conf "$pkgdir/usr/share/file-warden/file-warden.example.conf"

    make DEST_DIR="$pkgdir" PREFIX="/usr" install
}
