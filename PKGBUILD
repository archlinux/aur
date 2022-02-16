# Maintainer: jzbor <zborof at posteo dot de>
pkgname=moonwm
pkgver=8.0.0
pkgrel=3
pkgdesc="My own outstandingly named Window Manager (a dynamic window manager)"
arch=(x86_64 i686 aarch64)
url="https://github.com/jzbor/moonwm"
license=('MIT')
groups=()
depends=(libx11 libxcb libxinerama slop xmenu  arandr dmenu ffmpeg imagemagick libnotify
            notification-daemon otf-nerd-fonts-fira-code pademelon pavucontrol sound-theme-freedesktop
            xorg-xrandr xorg-xrdb)
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
sha512sums=('a1be68e30e637dec7aafb4427e5957b0a29f78c712b974cd744fb54cac95f8215bd075b55dac638c0c5899e78ef33ab5a56c66f0b48058fe38e1749269364052')
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


