pkgname=colorsvn
pkgver=0.3.3
pkgrel=1
pkgdesc="Subversion output colorizer"
arch=('any')
url="http://$pkgname.tigris.org"
license=('GPL2')
depends=('subversion' 'perl')
backup=("etc/${pkgname}rc"
        "etc/profile.d/$pkgname-env.sh")
source=("$url/files/documents/4414/49311/$pkgname-$pkgver.tar.gz")
md5sums=('1fd09db47f44227499c19f9ba3054b97')

build() {
	# Build colorsvn files
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	# Copy colorsvn files in package archive
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install

	# Copy CREDITS file in package archive
	install -D -o root -g root -m 644 CREDITS "$pkgdir/usr/share/licenses/$pkgname/CREDITS"
}

# vim: set ft=sh ts=4 sw=4 noet:
