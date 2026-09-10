# Maintainer: rikkichy
# Use the prepared, vendored source archive from packaging/build-release.sh.
# render-aur replaces only pkgver, source, sha256sums and _srcdir below.
pkgname=openwave
pkgver=1.1.1
pkgrel=1
pkgdesc="Linux control application for Elgato Wave hardware and PipeWire mixing"
arch=('x86_64')
url="https://github.com/rikkichy/openwave"
license=('MIT')
depends=('gtk4>=4.14' 'libadwaita>=1.5' 'adwaita-icon-theme' 'libusb' 'pipewire' 'wireplumber' 'alsa-utils' 'libpulse' 'swh-plugins' 'polkit')
makedepends=('make' 'pkgconf' 'rust>=1.98.1' 'clang')
source=("https://github.com/rikkichy/openwave/releases/download/v1.1.1/openwave-1.1.1.tar.gz")
sha256sums=('311a9339d84e05e5e5fe9d85669561746b259b60f446d42bd57d547bd564ed15')
_srcdir="openwave-1.1.1"

build() {
    cd "$srcdir/$_srcdir"
    export CARGO_NET_OFFLINE=true
    make build CARGO_BUILD_FLAGS='--release --frozen --offline --workspace --bins'
}

package() {
    cd "$srcdir/$_srcdir"
    make install DESTDIR="$pkgdir" PREFIX=/usr INSTALL_METHOD=arch \
        CARGO_BUILD_FLAGS='--release --frozen --offline --workspace --bins'
}
