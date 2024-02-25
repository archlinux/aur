# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Submitter:  not_anonymous <nmlibertarian@gmail.com>

pkgname=fdserver
pkgver=24.2.19
pkgrel=1
pkgdesc="Ham Radio - ARRL Field Day - Multi-user Server for clients using the fdlogger package"
license=('GPL-3.0-only')
arch=('any')
url="https://pypi.org/project/$pkgname/"
depends=('python' 'python-xmltodict' 'python-requests' 'sqlite' 'hamradio-menus' 'fdlogger')
makedepends=('python-build' 'python-installer' 'python-wheel')
provides=(fdserver)
conflicts=(fdserver-git)
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/${pkgname/-/_}-$pkgver.tar.gz"
	"$pkgname.1")

build() {
	cd $srcdir/$pkgname-$pkgver

	python -m build --wheel --no-isolation
}

package() {
	cd $srcdir/$pkgname-$pkgver

	python -m installer --destdir="$pkgdir" dist/*.whl

	mv $pkgdir/usr/bin/$pkgname $pkgdir/usr/bin/$pkgname.1
	install -Dm755 ../$pkgname.1 $pkgdir/usr/bin/$pkgname

	install -Dm755 $pkgname/data/k6gte-$pkgname.desktop $pkgdir/usr/share/applications/k6gte-$pkgname.desktop
	install -Dm755 $pkgname/data/k6gte.$pkgname.svg $pkgdir/usr/share/pixmaps/k6gte-$pkgname.svg
}
md5sums=('61b08b90e3a77164ea3f60346d50c29a'
         '22feefc9c03eeddd86785a77b4a5bc4e')
sha256sums=('cd9a9131fb9f0d1190c9018b95a5a6ef6b0999e0ea6eca73f677ddd29c498f4a'
            '88bc2d01839d6d3d5aaf98aec4ddad69824e1976ca0aab48ba3341da89dacd57')
