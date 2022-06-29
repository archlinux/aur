# Maintainer: Marcel Röthke <marcel@roethke.info>
# Contributor: Pierre Neidhardt <ambrevar@gmail.com>
# Contributor: csllbr; Popsch <popsch@gmx.net>

pkgname=mu
pkgver=1.8.2
pkgrel=1
pkgdesc="Maildir indexer/searcher and Emacs client (mu4e)"
arch=("x86_64" "armv7h")
url="http://www.djcbsoftware.nl/code/mu"
license=("GPL")
depends=("gmime3" "xapian-core" "guile3")
makedepends=("emacs" "meson")
optdepends=("emacs: mu4e support")
source=("https://github.com/djcb/mu/releases/download/v${pkgver}/mu-${pkgver}.tar.xz")
sha256sums=('ffac259cd594a10e948f36937fa32e1307aa35259eae9b858c0b92329166533f')

prepare() {
	cd "$pkgname-$pkgver"
	arch-meson \
		-Dc_args="${CFLAGS}" \
		-Dcpp_args="${CFLAGS}" \
		-Dc_link_args="${LDFLAGS}" \
		-Dcpp_link_args="${LDFLAGS}" \
		-Dguile=enabled \
		-Dreadline=enabled \
		build


}


build() {
	cd "$pkgname-$pkgver"
	ninja -C build
}

package() {
	cd "$pkgname-$pkgver"
	DESTDIR="${pkgdir}" meson install -C build
}
