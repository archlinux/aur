# Maintainer: Marcel Röthke <marcel@roethke.info>
# Contributor: Pierre Neidhardt <ambrevar@gmail.com>
# Contributor: csllbr; Popsch <popsch@gmx.net>

pkgname=mu
pkgver=1.8.8
pkgrel=1
pkgdesc="Maildir indexer/searcher and Emacs client (mu4e)"
arch=("x86_64" "armv7h")
url="http://www.djcbsoftware.nl/code/mu"
license=("GPL")
depends=("gmime3" "xapian-core")
makedepends=("emacs" "meson")
optdepends=("emacs: mu4e support")
source=("https://github.com/djcb/mu/releases/download/v${pkgver}/mu-${pkgver}.tar.xz")
sha256sums=('ac79eaa6cd2e01af7efe7d1f30a29a3e46f6d36abebc64f96d01c431cf38602e')

prepare() {
	cd "$pkgname-$pkgver"
	arch-meson \
		-Dc_args="${CFLAGS}" \
		-Dcpp_args="${CFLAGS}" \
		-Dc_link_args="${LDFLAGS}" \
		-Dcpp_link_args="${LDFLAGS}" \
		-Dguile=disabled \
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
