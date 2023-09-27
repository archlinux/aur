# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Submitter:  not_anonymous <nmlibertarian@gmail.com>

pkgname=fdserver-git
_pkgname=fdserver
pkgver=r25.6d75263
pkgrel=1
pkgdesc="Ham Radio - ARRL Field Day - Multi-user Server for clients using the fdlogger package - GIT version"
license=(GPL)
arch=(any)
url="https://github.com/mbridak/$_pkgname"
depends=('python' 'python-xmltodict' 'python-requests' 'sqlite' 'hamradio-menus' 'fdlogger')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel')
provides=(fdserver)
conflicts=(fdserver)
source=($_pkgname::"git+$url.git"
	$_pkgname.1)

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

	install -Dm755 $_pkgname/data/k6gte-$_pkgname.desktop $pkgdir/usr/share/applications/k6gte-$_pkgname.desktop
	install -Dm755 $_pkgname/data/k6gte-$_pkgname-128.png $pkgdir/usr/share/pixmaps/k6gte-$_pkgname.png
}
md5sums=('SKIP'
         '22feefc9c03eeddd86785a77b4a5bc4e')
sha256sums=('SKIP'
            '88bc2d01839d6d3d5aaf98aec4ddad69824e1976ca0aab48ba3341da89dacd57')
