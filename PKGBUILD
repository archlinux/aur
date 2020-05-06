# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Emiel Kollof <emiel@kollof.nl>
pkgname=dmenu-ekollof-git
pkgver=4.9.r2.b87e7ec
pkgrel=1
epoch=
pkgdesc="Emiel Kollof's personal patched build of dmenu."
arch=(x86_64)
url="https://git.hackerheaven.org/ekollof/dmenu-ekollof.git"
license=('MIT')
groups=()
depends=(sh ttf-twemoji-color ttf-joypixels dbus libxft-bgra libx11 libxinerama libxext freetype2)
makedepends=(git)
checkdepends=()
optdepends=()
provides=(dmenu)
conflicts=(dmenu)
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
    cd "dmenu-ekollof"
    printf "4.9.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "dmenu-ekollof"
	make > /dev/null
}

package() {
	cd "dmenu-ekollof"
	make DESTDIR="$pkgdir/" install
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
