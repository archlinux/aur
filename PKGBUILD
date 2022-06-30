# Maintainer: JohnyPea <johnypean@gmail.com>
# Contributor: somini <dev@somini.xyz>
# Contributor: Teyras <Teyras@gmail.com>
pkgname=purple-googlechat
pkgdesc="A Pidgin plugin to support the proprietary protocol used by Google for the Google Chat service"
url='https://github.com/EionRobb/purple-googlechat'
arch=('i686' 'x86_64' 'armv6h' 'aarch64') 
pkgver=r501.dfdd9c9
pkgrel=1
license=('GPLv3+')
provides=($pkgname)
conflicts=($pkgname-git)
depends=('libpurple' 'glib2' 'json-glib' 'protobuf-c')
makedepends=('git')
source=('purple-googlechat::git+https://github.com/EionRobb/purple-googlechat.git')
sha1sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$pkgname"
	make
}

package() {
	cd "$srcdir/$pkgname"
	destdir="$pkgdir$(pkg-config --variable plugindir purple)"
	install -Dm755 -t "$destdir" libgooglechat.so

	icondir="$pkgdir/usr/share/pixmaps/pidgin/protocols"
	echo "Icon Dir: $icondir"

	for size in 16 22 24 48; do
		install -TDm644 $srcdir/$pkgname/googlechat$size.png $icondir/$size/googlechat.png
	done
}
