# Maintainer: Davide Depau <davide@depau.eu>
# Contributor: Jerome Leclanche <jerome@leclan.ch>

pkgname=mmsd-git
pkgver=r648.f4b8b32
pkgrel=1
pkgdesc="Multimedia Messaging Service"
url="https://git.kernel.org/pub/scm/network/ofono/mmsd.git"
arch=("x86_64")
license=("GPL2")
provides=("mmsd")
conflicts=("mmsd")
depends=("dbus" "glib2")
makedepends=('git')
source=("$pkgname::git+https://git.kernel.org/pub/scm/network/ofono/mmsd.git")
sha256sums=("SKIP")

pkgver() {
  cd "$pkgname"
# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$pkgname"
	./bootstrap
	./configure \
		--prefix=/usr 
	make
}

package() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir" install
}
