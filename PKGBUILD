# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Submitter:  not_anonymous <nmlibertarian@gmail.com>

pkgname=wfdcurses
pkgver=23.1.14
pkgrel=1
pkgdesc="Ham Radio - WINTER Field Day logger - CURSES"
license=(GPL)
arch=(any)
url="https://pypi.org/project/$pkgname/"
depends=(python python-xmltodict python-requests python-pyperclip sqlite hamradio-menus)
makedepends=(python-build python-installer python-wheel)
provides=(wfdlogger)
conflicts=(wfdlogger wfdlogger-git wfdcurses-git)
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
	install -Dm755 $pkgname/data/k6gte.$pkgname-128.png $pkgdir/usr/share/pixmaps/k6gte-$pkgname.png
}
md5sums=('c4884d7a9941529b08c5eb97b1971029'
         'fb9a1d8255a7283cf3e2036a6cfd8c22')
sha256sums=('642c9af33e349015769e52cc4f2a4d4410138f2a7b849997c5bc57b5d39776c7'
            'f5bbc97e391802124a24094a42b565087cfab32888babba4c26719fc049d5c6b')
