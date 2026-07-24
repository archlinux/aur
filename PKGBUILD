# Maintainer: ash <ash@archlinux>
pkgname=wshowkeys-mao-rounded
_pkgname=wshowkeys
pkgver=0.1
pkgrel=1
pkgdesc='Displays keys being pressed on a Wayland session (DreamMaoMao fork + rounded corners)'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://github.com/bt-ASH/wshowkeys-mao-rounded'
license=('GPL')
depends=('cairo' 'pango' 'libinput' 'libxkbcommon' 'wayland')
makedepends=('meson' 'wayland-protocols')
provides=('wshowkeys')
conflicts=('wshowkeys' 'wshowkeys-git' 'wshowkeys-mao-git')
source=("$_pkgname::git+https://github.com/DreamMaoMao/wshowkeys.git"
        "rounded-corners.patch")
sha512sums=('SKIP'
            '453f053e0c90a7413122343739e85e22ea00685d91150fc955cf5135dfa4c044e4da75148ee844675f6ae7363093f895c694248946ac97b94811cc5b0c583bc3')

prepare() {
    cd "$srcdir/$_pkgname"
    patch -Np1 < "$srcdir/rounded-corners.patch"
}

build() {
    cd "$srcdir/$_pkgname"
    arch-meson build .
    ninja -C build
}

package() {
    cd "$srcdir/$_pkgname"
    DESTDIR="$pkgdir" ninja -C build install
    chmod a+s "$pkgdir/usr/bin/wshowkeys"
}
