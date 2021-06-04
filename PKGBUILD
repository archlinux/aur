#Maintainer: affe-ali <affe-ali@web.de>
#Co-Maintainer: Jannik Hauptvogel <jannikhv@gmail.com>
pkgname=gydl-git
pkgver=r111.ae2d296
pkgrel=1
pkgdesc="Gydl (Graphical Youtube-dl) is a GUI wrapper around the already existing youtube-dl program."
arch=('any')
url="https://github.com/JannikHv/gydl"
license=('GPL2')
depends=('python' 'gtk3' 'python-gobject' 'youtube-dl')
makedepends=('git' 'meson')
conflicts=('gydl')
source=("$pkgname"::"git+https://github.com/JannikHv/gydl.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$pkgname"
	# Remove any potential residual build files
	rm -rf build
	meson build --prefix=/usr
}

package() {
	cd "$srcdir/$pkgname/build"
	env DESTDIR="$pkgdir" ninja install
	install -D ../LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
