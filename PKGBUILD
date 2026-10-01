# Maintainer: Shorin <shorin@example.com>
_pkgname=linuxqq-wayland-clipboard-fix
pkgname=linuxqq-wayland-clipboard-fix-git
pkgver=r1.ffec072
pkgrel=1
pkgdesc="修复 Linux QQ 以 Wayland 运行时的剪贴板（QQ 内双向桥接 X11 与 Wayland 剪贴板，接替 linuxqq-clipsync）"
arch=('x86_64' 'aarch64')
url="https://github.com/SHORiN-KiWATA/linuxqq-wayland-clipboard-fix"
license=('MIT')
depends=('glibc' 'libx11' 'wayland' 'linuxqq')
makedepends=('git' 'pkgconf')
provides=('linuxqq-wayland-clipboard-fix')
conflicts=('linuxqq-wayland-clipboard-fix' 'linuxqq-clipsync-git')
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
