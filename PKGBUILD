# Maintainer: Thomas Roos <mail [at] thomasroos.nl>
# Co-maintainer: Liam Timms <timms5000@gmail.com>
# Contributor: wedjat <wedjat@protonmail.com>
# Contributor: Masoud <mpoloton@gmail.com>

pkgname=python-nibabel
_pkgname=nibabel
pkgver=3.2.0
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
sha512sums=('ca38ca2f79adb0931e8e4b9c3877ff0ba523dbe44b626b774bb8d5efa32e2d56ffe09abaf1f2bb9bcbc0ec748856d0ddcf4f3059e992ffc4c2bb7b443082c563')

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

