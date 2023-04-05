# Maintainer: PisonJay <PisonJay@outlook.com>

pkgname=libei-git
pkgver=0.4.1
pkgrel=0
pkgdesc="library for Emulated Input"
url="https://gitlab.freedesktop.org/libinput/libei/"
arch=(x86_64)
license=('MIT')
provides=('libei=0.4.1')
conflicts=('libei')

depends=('protobuf-c' 'libevdev' 'systemd' 'libxkbcommon')
makedepends=('meson' 'git')
source=("libei::git+https://gitlab.freedesktop.org/libinput/libei#tag=${pkgver}")
md5sums=('SKIP')

build() {
    arch-meson libei build \
    -D tests=false \
    -D documentation=false
    meson compile -C build
}

package() {
    DESTDIR="$pkgdir" meson install -C build

    install -Dvm644 libei/COPYING \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}