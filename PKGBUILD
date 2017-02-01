# Maintainer: not_anonymous <nmlibertarian@gmail.com>

pkgname=pyqso
_authorname=ctjacobs
pkgver=0.3
pkgrel=1
pkgdesc="Ham Radio QSO logging tool."
arch=('any')
url="http://christianjacobs.uk/pyqso/"
license=('GPL3')
depends=('gtk3' 'gobject-introspection' 'python-basemap' 'python-cairocffi')
#makedepends=('python-sphinx'	# for building docs)
optdepends=('hamlib: rig control'
	    'hamradio-menus: XDG compliant menuing')
source=(https://github.com/${_authorname}/$pkgname/archive/v${pkgver}.tar.gz
	diff.setup.py
	$pkgname.desktop
)

prepare() {
	cd $srcdir/$pkgname-$pkgver

	patch -p0 < ../diff.setup.py
	sed -i 's:icons:share\/pyqso\/icons:g' bin/pyqso
}

build () {
	cd $srcdir/$pkgname-$pkgver

#	make docs
}

package() {
	cd $srcdir/$pkgname-$pkgver

	python3 setup.py install --root="$pkgdir/" --optimize=1

	install -Dm644 icons/log_14x14.png $pkgdir/usr/share/pixmaps/$pkgname.png
	install -Dm644 ../$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop

#	mkdir -p $pkgdir/usr/share/$pkgname/docs/html/{_images,_modules/pyqso,_sources,_static}
#	cp -a docs/build/html/* $pkgdir/usr/share/$pkgname/docs/html/.
}
md5sums=('da6a627a8107ce5e84ec443467cda683'
         '876b5de8701d6239d0f87b6cec1d8820'
         'db5223623f0a745b15798e18c1f5fc0d')
sha256sums=('5550d1fedde75f1b801b9f2ef1fde33428ade337d3161b3ac56773028d655aa8'
            'f08c1511c480faba9725b9bfc4f2f78aab700c9c3fe770ba2e5dccfe7823d17e'
            'b724c3782338cd546f78719137802384364522e398fb6c5a633442d25a2afb17')
