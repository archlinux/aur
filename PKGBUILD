# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Emiel Kollof <emiel@kollof.nl>
pkgname=dwm-ekollof-git
pkgver=6.2.r38.56f1542
pkgrel=1
epoch=
pkgdesc="Emiel Kollof's personal patched build of dwm."
arch=(x86_64)
url="https://git.hackerheaven.org/ekollof/dwm-ekollof.git"
license=('MIT')
groups=()
depends=(nerd-fonts-iosevka ttf-twemoji-color ttf-joypixels dbus libxft-bgra dunst)
makedepends=(git libx11 libxinerama libxext freetype2)
checkdepends=()
optdepends=()
provides=(dwm)
conflicts=(dwm)
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
    cd "dwm-ekollof"
    printf "6.2.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "dwm-ekollof"
	make > /dev/null
}

package() {
	cd "dwm-ekollof"
	make DESTDIR="$pkgdir/" install
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 xsession/dwm.desktop "${pkgdir}/usr/share/xsessions/dwm.desktop"
}
