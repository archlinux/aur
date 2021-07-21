# Maintainer: lajonss <l3n1@dupaw.eu>
pkgname=wake-mobile-git
pkgver=1.7
pkgrel=1
pkgdesc="Proof-of-concept alarm app that uses systemd timers to wake up the system"
arch=('x86_64' 'aarch64')
url="https://gitlab.gnome.org/kailueke/wake-mobile"
license=('GPL2')
groups=()
depends=(
	'desktop-file-utils'
	'gobject-introspection-runtime'
	'glib2'
	'hicolor-icon-theme'
	'libcanberra'
	'libpulse'
	'python-gobject'
	'python-psutil'
)
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=(git+https://gitlab.gnome.org/kailueke/wake-mobile.git#tag=$pkgver)
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
    git describe --tags | sed 's/-/+/g'
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	sed -i 's/\/lib\/systemd/\/usr\/lib\/systemd/' Makefile
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}
