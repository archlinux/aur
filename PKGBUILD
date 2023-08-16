# Maintainer: Bert Peters <bert@bertptrs.nl>
# Contributor: wedjat <wedjat@protonmail.com>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>
pkgname=python-pydicom
pkgver=2.4.3
pkgrel=1
pkgdesc="Pure python package for working with DICOM files"
arch=("any")
url="https://pydicom.github.io/pydicom/stable/index.html"
license=('MIT' 'custom')
depends=('python')
makedepends=('python-setuptools')
optdepends=('python-numpy: for working with pixel data'
            'python-pillow: for working with compressed image data'
            'gdcm: for working with compressed JPEG, JPEG-LS and JPEG 2000 images'
            'python-pylibjpeg: for working with compressed JPEG images'
            'python-pylibjpeg-openjpeg: for working with compressed JPEG-LS or JPEG 2000 images'
            'python-pylibjpeg-rle: for working with compressed RLE images'
            )
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pydicom/pydicom/archive/v$pkgver.tar.gz")
md5sums=('699086918b267894f303d101b833406a')

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
	# CLI tests are broken, skip those
	PYTHONDONTWRITEBYTECODE=1 pytest -k "not TestCLIcall"
}
