pkgname=embuer
pkgver=0.2.3
pkgrel=1
pkgdesc="A small session runner an systemd user slice replacement for embedded systems"
arch=('x86_64')
url="https://github.com/NeroReflex/embuer"
license=('GPL')
depends=(
    'btrfs-progs'
)
optdepends=()
makedepends=('cargo')
source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('b1188e97192ddb497016e9967cf2b93f6098dcac7a2d423c6c7cf4bc9daedcbf')

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
