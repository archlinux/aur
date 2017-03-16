# Maintainer: Seppia <seppia@seppio.fish>
pkgname=dino-git
pkgver=r58.d3005bc
pkgrel=1
pkgdesc="Simple and modern Jabber/XMPP client written in vala"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/dino/dino"
license=('')
groups=()
depends=('glib2' 'gtk3' 'gpgme' 'libgee' 'libnotify' 'openssl' 'sqlite')
makedepends=('git' 'gcc' 'cmake' 'vala')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('dino::git+https://github.com/dino/dino')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

build() {
	cd "$srcdir/${pkgname%-git}"
	./configure
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/lib"
	mkdir -p "$pkgdir/usr/lib/plugins"
	install build/dino "$pkgdir/usr/bin/"
	install build/*.so "$pkgdir/usr/lib/"
	install build/plugins/*.so "$pkgdir/usr/lib/plugins/"
	make DESTDIR="$pkgdir/" install
}
