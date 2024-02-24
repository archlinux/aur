# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Submitter:  not_anonymous <nmlibertarian@gmail.com>

pkgname=wfdlogger
pkgver=24.2.19
pkgrel=1
pkgdesc="Ham Radio - WINTER Field Day logger GUI"
license=(GPL-3.0-only)
arch=(any)
url="https://pypi.org/project/$pkgname"
depends=(python python-dicttoxml python-xmltodict python-pyqt5 python-requests sqlite hamradio-menus)
makedepends=(python-build python-installer python-wheel)
provides=(wfdlogger)
conflicts=(fdlogger fdcurses fdlogger-git wfdlogger-git)
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
	install -Dm755 $pkgname/data/k6gte-$pkgname.png $pkgdir/usr/share/pixmaps/k6gte-$pkgname.png
}
md5sums=('f6c37e495fb1823c1728a1cc50622aaf'
         '931867e6bb8f23afa30142f80fa2c5a1')
sha256sums=('15254139aa305213a85a89dcf4984d77b723c5837db71971b2188763290bfec1'
            '6e1ca820758f1ad3a82e7b616180d66f17d4e49615f7c8f553a8ca8f5f5df4f7')
