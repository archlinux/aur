# Maintainer: jzbor <zborof at posteo dot de>
pkgname=moonwm
pkgver=8.1.0
pkgrel=4
pkgdesc="My own outstandingly named Window Manager (a dynamic window manager)"
arch=(x86_64 i686 aarch64)
url="https://github.com/jzbor/moonwm"
license=('MIT')
groups=()
depends=(libx11 libxcb libxinerama slop xmenu  arandr dmenu ffmpeg imagemagick libnotify
            notification-daemon pademelon pavucontrol sound-theme-freedesktop
	    ttf-firacode-nerd xorg-xrandr xorg-xrdb)
makedepends=(go-md2man pkgconf)
checkdepends=()
optdepends=('scrot: integrated screenshot support'
            'pimenu: middleclick on desktop for pie-shaped favorites menu')
provides=(moonwm)
conflicts=(moonwm)
replaces=()
backup=()
options=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
noextract=()
sha512sums=('ed6e9460789d5cbf9a8a5c53d89eb44ac81904a50a4730121f9a08aa34736d19a24b85042a6a03d1c6afed290a0e05be8b6e4e35ac41fbdbe9ccd2a934a53a16')
validpgpkeys=()

build() {
	cd "$pkgname-$pkgver"
    make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11 FREETYPEINC=/usr/include/freetype2
}

package() {
	cd "$pkgname-$pkgver"
    make PREFIX=/usr DESTDIR="${pkgdir}" install-all
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/$pkgname/README.md"
}


