# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Submitter:  not_anonymous <nmlibertarian@gmail.com>

pkgname=fdserver
pkgver=23.6.12
pkgrel=1
pkgdesc="Ham Radio - ARRL Field Day - Multi-user Server for clients using the fdlogger package"
license=('GPL')
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
md5sums=('a33d78434aedf3cee92ab9c324df3457'
         '22feefc9c03eeddd86785a77b4a5bc4e')
sha256sums=('c68d6a916b4cce179e70872af43f6a0660bd732e0ae8ba47c7c72be2467b1314'
            '88bc2d01839d6d3d5aaf98aec4ddad69824e1976ca0aab48ba3341da89dacd57')
