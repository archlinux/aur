# Maintainer: jzbor <zborof at posteo dot de>
pkgname=pademelon
pkgver=1.1.0
pkgrel=2
pkgdesc="A desktop manager for modular Linux desktop setups"
arch=(x86_64)
url="https://github.com/jzbor/pademelon"
license=('MIT')
groups=()
depends=(acpilight arandr gtk3 imagemagick imlib2 libcanberra libinih libpulse libx11 libxrandr
            lxappearance-gtk3 python-gobject python3 xorg-setxkbmap)
makedepends=(go-md2man pkgconf)
checkdepends=()
optdepends=( 'moonwm: a good default wm'
	'pademelon-desktop: applications to make a desktop environment out of pademelon')
provides=(xdg-xmenu)
conflicts=(xdg-xmenu)
replaces=()
backup=('etc/pademelon/pademelon.conf')
options=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
noextract=()
sha512sums=('29afe4fca992e924304ff6b4b6237080045a8d95cdfd2d0ab3446f8a4d7aad5fb394bfa382f3af09ebe0efa21b7fac174889b2fc76826917f094a2d794ec33c7')
validpgpkeys=()
install=$pkgname.install

build() {
	cd "$pkgname-$pkgver"
    make
}

package() {
	cd "$pkgname-$pkgver"
    make PREFIX=/usr DESTDIR="${pkgdir}" install-all
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/$pkgname/README.md"
    install -Dm644 doc/* -t "${pkgdir}/usr/share/doc/$pkgname"
}


