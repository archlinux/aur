pkgname=embuer
pkgver=0.2.23
pkgrel=1
pkgdesc="A small session runner an systemd user slice replacement for embedded systems"
arch=('x86_64')
url="https://github.com/NeroReflex/embuer"
license=('GPL')
depends=(
    'btrfs-progs'
    'xz'
)
optdepends=()
makedepends=('cargo')
source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('07175b940d02cb51981e8dabe4cc9b74841bd3f1f55970a08550278b10e41630')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    # Unset system-wide CFLAGS/CXXFLAGS/LDFLAGS and RUSTFLAGS that break linking
    env -u CFLAGS -u CXXFLAGS make build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    # Ensure install runs without interfering env vars and installs into $pkgdir
    env -u CFLAGS -u CXXFLAGS make DESTDIR="$pkgdir" install
}
