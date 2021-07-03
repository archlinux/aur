# Maintainer: Ke Liu <spcter119@gmail.com>

pkgname=python-bullet
_name=${pkgname#python-}
pkgver=2.2.0
pkgrel=1
pkgdesc="Extensive support for Python list prompts formatting and colors."
arch=(any)
url=https://pypi.org/project/bullet
license=(MIT)
depends=(python)
makedepends=(python-setuptools)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz
        https://raw.githubusercontent.com/Mckinsey666/bullet/master/LICENSE)
sha512sums=(03782766ec7e70a32c43f337dca7964cdadc40da4442cdd2522354f9427763ef55cc3ceb4b3cb5a0cc18d5befab946eb7bddc05c3585773a13753afb3bdd7430 SKIP)

build() {
	cd $srcdir/${_name}-$pkgver
	python setup.py clean --all
	python setup.py build
}

package() {
	cd $srcdir/${_name}-$pkgver
	python setup.py install --root $pkgdir --skip-build --optimize=1
	install -Dm644 $srcdir/LICENSE $pkgdir/usr/share/licenses/${pkgname}/LICENSE
}
