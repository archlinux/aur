# Maintainer: Thomas Roos <mail [at] thomasroos.nl>
# Co-maintainer: Liam Timms <timms5000@gmail.com>
# Contributor: wedjat <wedjat@protonmail.com>
# Contributor: Masoud <mpoloton@gmail.com>

_pkgname=nibabel
pkgname=python-$_pkgname
pkgver=5.0.0
pkgrel=3
pkgdesc='Python library for reading and writing of some common neuroimaging file formats'
arch=('any')
url='http://nipy.org/nibabel'
license=('MIT')
depends=('python-numpy>=1.19' 
         'python-packaging')
makedepends=('python-hatch-vcs'
             'python-setuptools'
             'python-build'
             'python-installer')
optdepends=('python-scipy: for full SPM-ANALYZE support' 
            'python-memory-profiler'
            'python-fuse'
            'python-pydicom: for DICOM support' 
            'python-pillow: for PNG conversion in DICOMFS' 
            'python-h5py: for MINC2 support' 
            'python-indexed-gzip: for faster reading of NIFTI files')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/nipy/${_pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('844d2ef7c04376068dcc8ac2daaa2842d2a06812c283bc97dd8fe6b0c6dfa03b03f4413e2061feefffcb257396e1481e4419cf82a0e108149cbdca1336e16e64')

build()
{
  	cd "$srcdir/${_pkgname}-$pkgver"
  	python -m build --wheel --no-isolation
}


package()
{
  	cd "$srcdir/${_pkgname}-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

