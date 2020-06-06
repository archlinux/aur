# Maintainer: Syaoran Code <syaorancode@gmail.com>

pkgname=dwmblocks-syaoran-git
_dir=dwmblocks-syaoran
pkgver=0.1r9.1c1a0df
pkgrel=2
pkgdesc="This is clickable statusbar for dwm."
arch=(x86_64)
url="https://gitlab.com/justanoobcoder/dwmblocks-syaoran.git"
license=('GPL')
depends=(libx11 pacman-contrib networkmanager pulseaudio pulseaudio-alsa alsa-utils htop ibus ibus-bamboo)
makedepends=(make)
provides=(dwmblocks)
conflicts=(dwmblocks)
source=("git+$url")
md5sums=('SKIP')

pkgver() {
    cd "$_dir"
    printf "0.1r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_dir"
	make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
	cd "$_dir"
    mkdir -p ${pkgdir}/opt/${pkgname}
    cp -rf * ${pkgdir}/opt/${pkgname}
	make PREFIX=/usr DESTDIR="$pkgdir/" install
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
