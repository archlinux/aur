# Maintainer: jzbor <zborof at posteo dot de>
pkgname=pademelon-git
pkgver=1.1.0.r6.g7e9c21b
pkgrel=1
pkgdesc="A desktop manager for modular Linux desktop setups"
arch=(x86_64)
url="https://github.com/jzbor/pademelon"
license=('MIT')
groups=()
depends=(acpilight arandr gtk3 imagemagick imlib2 libcanberra libinih libnotify libpulse libx11
            libxrandr lxappearance-gtk3 python-gobject python3 xorg-setxkbmap)
makedepends=(go-md2man pkgconf)
checkdepends=()
optdepends=( 'moonwm: a good default wm'
	'pademelon-desktop: applications to make a desktop environment out of pademelon')
provides=(xdg-xmenu)
conflicts=(xdg-xmenu)
replaces=()
backup=('etc/pademelon/pademelon.conf')
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
    make
}

package() {
	cd "${pkgname%-git}"
    make PREFIX=/usr DESTDIR="${pkgdir}" install-all
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/$pkgname/README.md"
    install -Dm644 doc/* -t "${pkgdir}/usr/share/doc/$pkgname"
}


