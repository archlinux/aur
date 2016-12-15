# Maintainer: Jaume Delclòs Coll <jaume@delclos.com>
pkgname=weeb-git
pkgver=r40.872c920
pkgrel=1
pkgdesc="A library manager for anime and series"
arch=("i686" "x86_64")
url="https://github.com/cosarara97/fucking-weeb"
license=('GPL3')
depends=('gtk3')
makedepends=('git' 'chicken')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('weeb::git+https://github.com/cosarara97/fucking-weeb.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make deployable
	# they hold references to $srcdir, and we don't need them
	rm deploy_dir/weeb/*.setup-info
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}
