# Maintainer: Joaquim Monteiro <joaquim.monteiro@protonmail.com>
pkgname=wayland-proxy-git
pkgver=1.0.r4.g1bd4f5f
pkgrel=1
pkgdesc="Load balancer for Wayland clients to prevent clients from being disconnected by the window server if under heavy load"
arch=(x86_64 i686 armv7h aarch64 riscv64)
url="https://github.com/stransky/wayland-proxy"
license=('MPL-2.0')

depends=('glibc' 'gcc-libs')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")

source=('git+https://github.com/stransky/wayland-proxy')
sha1sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
    printf "%s" "$(git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname%-git}"
    g++ $CXXFLAGS $LDFLAGS src/wayland-proxy.cpp src/main.cpp -o wayland-proxy
}

package() {
	cd "$srcdir/${pkgname%-git}"
    install -Dm755 wayland-proxy "$pkgdir/usr/bin/wayland-proxy"
}
