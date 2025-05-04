# Maintainer: Marcel Röthke <marcel@roethke.info>
# Contributor: Pierre Neidhardt <ambrevar@gmail.com>
# Contributor: csllbr; Popsch <popsch@gmx.net>

pkgname=mu
pkgver=1.12.10
pkgrel=1
pkgdesc="Maildir indexer/searcher and Emacs client (mu4e)"
arch=("x86_64" "armv7h")
url="http://www.djcbsoftware.nl/code/mu"
license=("GPL-3.0-or-later")
depends=("gmime3" "xapian-core" "readline" "glib2")
makedepends=("emacs" "meson" "guile")
optdepends=(
	"emacs: mu4e support"
	"guile: guile bindings"
)
source=("https://github.com/djcb/mu/releases/download/v${pkgver}/mu-${pkgver}.tar.xz")
sha256sums=('b6dbcd1cb970d31ab71bd743e7c1bc928c96b28eb31fb6b5354c0fa13ec6da7a')

prepare() {
	cd "$pkgname-$pkgver"
	arch-meson \
		-Dc_args="${CFLAGS}" \
		-Dcpp_args="${CFLAGS}" \
		-Dc_link_args="${LDFLAGS}" \
		-Dcpp_link_args="${LDFLAGS}" \
		-Dguile=enabled \
		-Dreadline=enabled \
		-Dcld2=disabled \
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
