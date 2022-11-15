# Maintainer: jzbor <zborof at posteo dot de>
pkgname=moonwm-git
pkgver=8.1.0.r4.g026549f
pkgrel=2
pkgdesc="My own outstandingly named Window Manager (a dynamic window manager)"
arch=(x86_64 i686 aarch64)
url="https://github.com/jzbor/moonwm"
license=('MIT')
groups=()
depends=(libx11 libxcb libxinerama slop xmenu  arandr dmenu ffmpeg imagemagick libnotify
            notification-daemon pademelon pavucontrol sound-theme-freedesktop
	    ttf-firacode-nerd xorg-xrandr xorg-xrdb)
makedepends=(git go-md2man pkgconf)
checkdepends=()
optdepends=('scrot: integrated screenshot support'
            'pimenu: middleclick on desktop for pie-shaped favorites menu')
provides=(moonwm)
conflicts=(moonwm)
replaces=()
backup=()
options=()
source=("git+$url")
noextract=()
sha512sums=('SKIP')
validpgpkeys=()

pkgver() {
	cd "${pkgname%-git}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${pkgname%-git}"
    make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11 FREETYPEINC=/usr/include/freetype2
}

package() {
	cd "${pkgname%-git}"
    make PREFIX=/usr DESTDIR="${pkgdir}" install-all
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname%-git}/README.md"
}


