# Maintainer: Ke Liu <spcter119@gmail.com>

pkgname=python-tgs
_name=${pkgname//python-}
pkgver=0.4.4
pkgrel=1
pkgdesc='Telegram Animated Stickers Tools'
arch=(any)
url=https://pypi.org/project/tgs
license=(MIT)
depends=(python)
makedepends=(python-setuptools)
optdepends=(python-coverage python-pillow 'python-pypotrace>=0.2' python-numpy python-scipy python-cairosvg python-fonttools)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-$pkgver.tar.gz
        LICENSE::https://gitlab.com/mattia.basaglia/tgs/raw/master/COPYING)
md5sums=('08e914bd1d94ea930a13f49a99b808fc'
         'bf4f3c60e4d121211608f0ad0dbaf67c')

build() {
	cd $srcdir/${_name}-$pkgver
	python setup.py build
}

package() {
	cd $srcdir/${_name}-$pkgver
	python setup.py install --root $pkgdir --skip-build --optimize=1
	install -Dm644 $srcdir/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
