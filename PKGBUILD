# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Submitter:  not_anonymous <nmlibertarian@gmail.com>

pkgname=fdlogger
pkgver=23.6.25
pkgrel=1
pkgdesc="Ham Radio - ARRL Field Day logger GUI"
license=('GPL')
arch=('any')
url="https://pypi.org/project/fdlogger/"
depends=('python' 'python-dicttoxml' 'python-xmltodict' 'python-pyqt5' 'python-requests' 'sqlite' 'hamradio-menus')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/${pkgname/-/_}-$pkgver.tar.gz"
	"fdlogger.1")

build() {
	cd $srcdir/$pkgname-$pkgver

	python -m build --wheel --no-isolation
}

package() {
	cd $srcdir/$pkgname-$pkgver

	python -m installer --destdir="$pkgdir" dist/*.whl

	mv $pkgdir/usr/bin/$pkgname $pkgdir/usr/bin/$pkgname.1
	install -Dm755 ../$pkgname.1 $pkgdir/usr/bin/$pkgname

	install -Dm755 $pkgname/data/k6gte-fieldday.desktop $pkgdir/usr/share/applications/k6gte-fieldday.desktop
	install -Dm755 build/lib/fdlogger/icon/k6gte-fdlogger.png $pkgdir/usr/share/pixmaps/k6gte-fdlogger.png
}
md5sums=('8902a2f3be94d642f1a8b7d4cd1da1e8'
         '4d29a2367a568ed7c5d5c2857d4f7fb7')
sha256sums=('6594560a15c3e1d4e7fb1d2977a102b46a9385f50dd845544e88094fb204eef9'
            'ab08f8f9578f9e96b40bb0a22c82c6dac53e75764bb0912e60c95a6cd1f8b8a5')
