# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Submitter:  not_anonymous <nmlibertarian@gmail.com>

pkgname=fdlogger-git
_pkgname=fdlogger
__pkgname=FieldDayLogger
___pkgname=fieldday
pkgver=r417.9e6612e
pkgrel=1
pkgdesc="Ham Radio - ARRL Field Day logger GUI - GIT version"
license=('GPL')
arch=('any')
url="https://github.com/mbridak/$__pkgname"
depends=('python' 'python-dicttoxml' 'python-xmltodict' 'python-pyqt5' 'python-requests' 'sqlite' 'hamradio-menus')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel')
provides=(fdlogger)
conflicts=(fdlogger fdcurses)
source=($_pkgname::"git+$url.git"
	"$_pkgname.1")

pkgver() {
	cd "$srcdir/$_pkgname"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare(){
	git -C "$srcdir/$_pkgname" clean -dfx
}

build() {
	cd $srcdir/$_pkgname

	python -m build --wheel --no-isolation
}

package() {
	cd $srcdir/$_pkgname

	python -m installer --destdir="$pkgdir" dist/*.whl

	mv $pkgdir/usr/bin/$_pkgname $pkgdir/usr/bin/$_pkgname.1
	install -Dm755 ../$_pkgname.1 $pkgdir/usr/bin/$_pkgname

	install -Dm755 $_pkgname/data/k6gte-$___pkgname.desktop $pkgdir/usr/share/applications/k6gte-$___pkgname.desktop
	install -Dm755 $_pkgname/icon/k6gte-$_pkgname.png $pkgdir/usr/share/pixmaps/k6gte-$_pkgname.png
}
md5sums=('SKIP'
         '4d29a2367a568ed7c5d5c2857d4f7fb7')
sha256sums=('SKIP'
            'ab08f8f9578f9e96b40bb0a22c82c6dac53e75764bb0912e60c95a6cd1f8b8a5')
