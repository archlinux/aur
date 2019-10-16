# Maintainer: Ke Liu <spcter119@gmail.com>

pkgname=python-tgs
pkgver=0.3.4
pkgrel=1
pkgdesc='Telegram Animated Stickers Tools'
arch=('any')
url='https://pypi.org/project/tgs'
license=('MIT')
depends=('python')
_pkgname=${pkgname//python-}
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
        "LICENSE::https://gitlab.com/mattia.basaglia/tgs/raw/master/COPYING")
md5sums=('012a7689a3442d3487667b024c30ac2d'
         'SKIP')

build() {
	cd "${_pkgname}-${pkgver}"
	python setup.py clean --all
	python setup.py build
}

package() {
	cd "${_pkgname}-${pkgver}"
	python setup.py install --root "$pkgdir" --skip-build --optimize=1
	install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
