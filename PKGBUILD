# Maintainer: PisonJay <PisonJay@outlook.com>

pkgname=libei-git
pkgver=0.99.1.r19.gcf932d1
pkgrel=1
pkgdesc="library for Emulated Input"
url="https://gitlab.freedesktop.org/libinput/libei/"
arch=(x86_64)
license=('MIT')
provides=('libei')
conflicts=('libei')

depends=('protobuf-c' 'libevdev' 'systemd' 'libxkbcommon')
makedepends=('meson' 'git')
source=("libei::git+https://gitlab.freedesktop.org/libinput/libei.git/")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/libei"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    arch-meson libei build \
    -D tests=disabled
    meson compile -C build
}

package() {
    DESTDIR="$pkgdir" meson install -C build

    install -Dvm644 libei/COPYING \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
