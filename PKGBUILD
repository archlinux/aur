# Maintainer: Shorin <shorin@example.com>
_pkgname=linuxqq-wayland-fix
pkgname=linuxqq-wayland-fix-git
pkgver=r69.7557313
pkgrel=1
pkgdesc="修复 Linux QQ 在 Wayland 下的屏幕共享、共享电脑声音、剪贴板和截图问题"
arch=('x86_64' 'aarch64')
url="https://github.com/SHORiN-KiWATA/linuxqq-wayland-fix"
license=('MIT')
depends=('glibc' 'glib2' 'libx11' 'wayland' 'linuxqq')
makedepends=('git' 'libpulse' 'libpipewire' 'pkgconf')
provides=('linuxqq-wayland-fix')
conflicts=('linuxqq-wayland-fix' 'linuxqq-clipsync')
optdepends=('xdg-desktop-portal: 屏幕录制（需要合成器对应的后端）')
options=('!debug')
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
