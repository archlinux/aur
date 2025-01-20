pkgname=file-warden
pkgver=1.0.1
pkgrel=1
pkgdesc="Systemd-managed file monitoring"
arch=('x86_64')
url="https://github.com/AntoninoAdornetto/file-warden"
license=('GPL3')
depends=('libnotify>=0.8.0')
makedepends=('gcc' 'pkg-config' 'git')
source=("git+${url}.git#tag=${pkgver}")
sha256sums=('SKIP')

pkgver() {
    cd $pkgname
    git describe --tags | sed 's/^v//'
}

build() {
    cd $pkgname
    make build
}

package() {
    cd "$pkgname"

    install -Dm644 docs/file-warden.example.service "$pkgdir/usr/lib/systemd/user/file-warden.service"
    install -Dm644 docs/file-warden.example.conf "$pkgdir/usr/share/file-warden/file-warden.example.conf"

    make DEST_DIR="$pkgdir" PREFIX="/usr" install
}
