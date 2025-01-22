pkgname=file-warden
pkgver=1.0.3
pkgrel=1
install=file-warden.install
pkgdesc="Systemd-managed file monitoring"
arch=('x86_64')
url="https://github.com/AntoninoAdornetto/file-warden"
license=('MIT')
depends=('libnotify>=0.8.0')
makedepends=('gcc' 'pkg-config' 'git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('315968878be425776a26585c96cc0606d4fb8bee8c7f689c1994ddb1a509552d')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -D -m 644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname"
    install -D -m 644 docs/file-warden.example.conf "$pkgdir/usr/share/file-warden/config"
    install -D -m 644 docs/file-warden.example.service "$pkgdir/usr/lib/systemd/user/file-warden.service"
    install -D -m 755 $pkgname "$pkgdir/usr/bin/$pkgname"
}
