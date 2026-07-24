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
            '77f3cfb4e3f273f983cb44962a8999af7e6688b351fa429339509b288c4f764760172de8eae35f0a906114796934ffd150a71b0acb9f27e67a489d333db2f050')

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
