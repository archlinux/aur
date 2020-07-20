# Maintainer: Thomas Roos <mail [at] thomasroos.nl>
# Co-maintainer: Liam Timms <timms5000@gmail.com>
# Contributor: wedjat <wedjat@protonmail.com>
# Contributor: Masoud <mpoloton@gmail.com>

pkgname=python-nibabel
_pkgname=nibabel
pkgver=3.1.1
pkgrel=1
pkgdesc='Python library for reading and writing of some common neuroimaging file formats'
arch=('any')
url='http://nipy.org/nibabel'
license=('MIT')
depends=('python' 'python-numpy>=1.13' 'python-six>=1.3')
# building documentation may not work properly, since authors tell to use sphinx <=1.5.6, because "Sphinx >= 1.6 breaks the math_dollar extension"
makedepends=('python-setuptools')
# checkdepends=('python-nose' 'python-mock')
optdepends=('python-scipy: for full SPM-ANALYZE support' 'python-pydicom: for DICOM support' 'python-pillow: for PNG conversion in DICOMFS' 'python-h5py: for MINC2 support' 'python-indexed-gzip')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/nipy/${_pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('194c32d04787da4bc01967cdae498af1ffe835fffb0966f8778225098b2832254b536e630d71a81fd7486407775fe93e2802c6265f4e178cdc7a5743de6a8772')

build()
{
  	cd "$srcdir/${_pkgname}-$pkgver"
  	python setup.py build
}


package()
{
  	cd "$srcdir/${_pkgname}-$pkgver"
	python setup.py install --skip-build --root="$pkgdir" --optimize=1
    install -Dm644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

