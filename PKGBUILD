# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Submitter:  not_anonymous <nmlibertarian@gmail.com>

pkgname=fdlogger
pkgver=24.2.21
pkgrel=1
pkgdesc="Ham Radio - ARRL Field Day logger GUI"
license=('GPL-3.0-only')
arch=('any')
url="https://pypi.org/project/fdlogger/"
depends=('python' 'python-dicttoxml' 'python-xmltodict' 'python-pyqt5' 'python-requests' 'sqlite' 'hamradio-menus')
makedepends=('python-build' 'python-installer' 'python-wheel')
provides=('fdlogger')
conflicts=('fdcurses' 'fdlogger-git')
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
md5sums=('6bf85d0b7be38b1fa0cd73234e0c36c5'
         '4d29a2367a568ed7c5d5c2857d4f7fb7')
sha256sums=('cdfc9a480239d4b486b5a07287379eb2931a417e18899c6bb1b34125c20c9955'
            'ab08f8f9578f9e96b40bb0a22c82c6dac53e75764bb0912e60c95a6cd1f8b8a5')
