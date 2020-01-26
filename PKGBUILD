# Maintainer: Ke Liu <spcter119@gmail.com>

pkgname=python-tgs
_name=${pkgname//python-}
pkgver=0.3.6
pkgrel=2
pkgdesc='Telegram Animated Stickers Tools'
arch=('any')
url='https://pypi.org/project/tgs'
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-$pkgver.tar.gz"
        "LICENSE::https://gitlab.com/mattia.basaglia/tgs/raw/master/COPYING")
md5sums=('dacf23a870cc033816f920b806c86406'
         'SKIP')

build() {
	cd "$srcdir/${_name}-$pkgver"
	python setup.py clean --all
	python setup.py build
}

package() {
	cd "$srcdir/${_name}-$pkgver"
	python setup.py install --root "$pkgdir" --skip-build --optimize=1
	install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
