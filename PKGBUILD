# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Submitter:  not_anonymous <nmlibertarian@gmail.com>

pkgname=fdcurses
pkgver=24.10.31
pkgrel=1
pkgdesc="Ham Radio - ARRL Field Day logger CURSES"
license=('GPL-3.0-only')
arch=('any')
url="https://pypi.org/project/$pkgname/"
depends=('python' 'python-xmltodict' 'python-requests' 'python-pyperclip' 'sqlite' 'hamradio-menus')
makedepends=('python-build' 'python-installer' 'python-wheel')
provides=('fdlogger')
conflicts=('fdlogger' 'fdlogger-git')
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
md5sums=('ecd7d35993a0ccfcc3ee6d9400b70e75'
         'df5c242a0f63381781a4335080556af1')
sha256sums=('1827c6c4a9c40b2903083123251ab493388bd101af12dfd575d17847f5ca5573'
            '413e0fdf4bf367ff563ffb91e3aa357a87d5c8a9784edcdeeea53fccf6ee0094')
