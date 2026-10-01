# Maintainer: Shorin <shorin@example.com>
_pkgname=linuxqq-wayland-screenshare-fix
pkgname=linuxqq-wayland-native-screenshare-fix-git
pkgver=r3.0534d0a
pkgrel=1
pkgdesc="修复 Linux QQ 在 Wayland 下的屏幕共享（启用 QQ 自带的 portal + PipeWire 采集路径）"
arch=('x86_64' 'aarch64')
url="https://github.com/SHORiN-KiWATA/linuxqq-wayland-screenshare-fix"
license=('MIT')
depends=('glibc' 'glib2')
makedepends=('git' 'libpulse' 'libpipewire' 'pkgconf')
optdepends=('linuxqq: QQ 本体'
            'xdg-desktop-portal: 屏幕录制（需要合成器对应的后端）')
provides=('linuxqq-wayland-native-screenshare-fix')
conflicts=('linuxqq-wayland-native-screenshare-fix')
source=("$_pkgname::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$_pkgname"
    make VERSION="$pkgver"
}

package() {
    cd "$_pkgname"
    make install DESTDIR="$pkgdir" PREFIX=/usr VERSION="$pkgver"
}
