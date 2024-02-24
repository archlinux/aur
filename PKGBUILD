# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Submitter:  not_anonymous <nmlibertarian@gmail.com>

pkgname=wfdserver
pkgver=24.2.19
pkgrel=1
pkgdesc="Ham Radio - WINTER Field Day - Multi-user Server for clients using the fdlogger package"
license=(GPL-3.0-only)
arch=(any)
url="https://pypi.org/project/$pkgname/"
depends=(python python-xmltodict python-requests sqlite hamradio-menus wfdlogger)
makedepends=(python-build python-installer python-wheel)
provides=(wfdserver)
conflicts=(wfdserver-git)
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
md5sums=('612510fea41782c82fd9cff7c3a3f0e7'
         '191d01a89f8e62ba1ca70fc7448747a6')
sha256sums=('7e5cbaa7f4e3d123188a80083fb41ce671ecbaa4bf11ba57f57745198bcfaa7d'
            '0bd8dc5a342bb333660ec73a54f3f92e9dc8900ce01810fb17d58f3b3a5ccca3')
