# Maintainer: Bert Peters <bert@bertptrs.nl>
# Maintainer: wedjat <wedjat@protonmail.com>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>
pkgname=('python-pydicom' 'python2-pydicom')
pkgver=1.2.2
pkgrel=1
pkgdesc="Pure python package for working with DICOM files"
arch=("any")
url="https://pydicom.github.io/pydicom/stable/index.html"
license=('MIT' 'custom')
depends=('python')
makedepends=('python-setuptools' 'python2-setuptools')
optdepends=('python-numpy: for working with pixel data'
            'python-pillow: for working with compressed image data')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pydicom/pydicom/archive/v$pkgver.tar.gz")
md5sums=('f14bc9cde4e3c700e34807113e781a2b')

build()
{
	cd "$srcdir/pydicom-$pkgver"
	python setup.py build
}

package_python-pydicom()
{
	cd "$srcdir/pydicom-$pkgver"
	python setup.py install --skip-build --root="$pkgdir"/ --optimize=1

	install -D "$srcdir/pydicom-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python2-pydicom()
{
	depends=('python2')
	optdepends=('python2-numpy: for working with pixel data'
                'python2-pillow: for working with compressed image data')
	cd "$srcdir/pydicom-$pkgver"
	python2 setup.py install --skip-build --root="$pkgdir"/ --optimize=1

	install -D "$srcdir/pydicom-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}


check()
{
	cd "$srcdir/pydicom-$pkgver"
	PYTHONDONTWRITEBYTECODE=1 pytest
}
