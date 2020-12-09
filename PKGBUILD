# Maintainer: Bert Peters <bert@bertptrs.nl>
# Maintainer: wedjat <wedjat@protonmail.com>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>
pkgname=python-pydicom
pkgver=2.1.2
pkgrel=1
pkgdesc="Pure python package for working with DICOM files"
arch=("any")
url="https://pydicom.github.io/pydicom/stable/index.html"
license=('MIT' 'custom')
depends=('python')
makedepends=('python-setuptools')
optdepends=('python-numpy: for working with pixel data'
            'python-pillow: for working with compressed image data')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pydicom/pydicom/archive/v$pkgver.tar.gz")
md5sums=('398d943c9da2aec28857b60fe7e02123')

build()
{
	cd "$srcdir/pydicom-$pkgver"
	python setup.py build
}

package()
{
	cd "$srcdir/pydicom-$pkgver"
	python setup.py install --skip-build --root="$pkgdir"/ --optimize=1

	install -D "$srcdir/pydicom-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

check()
{
	cd "$srcdir/pydicom-$pkgver"
	PYTHONDONTWRITEBYTECODE=1 pytest
}
