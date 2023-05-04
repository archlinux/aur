# Maintainer: Thomas Roos <mail [at] thomasroos.nl>
# Co-maintainer: Liam Timms <timms5000@gmail.com>
# Contributor: wedjat <wedjat@protonmail.com>
# Contributor: Masoud <mpoloton@gmail.com>

_pkgname=nibabel
pkgname=python-$_pkgname
pkgver=5.1.0
pkgrel=1
pkgdesc='Python library for reading and writing of some common neuroimaging file formats'
arch=('any')
url='http://nipy.org/nibabel'
license=('MIT')
depends=('python-numpy>=1.19' 
         'python-packaging>=17'
         'python-setuptools')
makedepends=('python-hatch-vcs'
             'python-build'
             'python-installer')
optdepends=('python-scipy: for full SPM-ANALYZE support' 
            'python-memory-profiler'
            'python-fuse'
            'python-pydicom: for DICOM support' 
            'python-pillow: for PNG conversion in DICOMFS' 
            'python-h5py: for MINC2 support' 
            'python-indexed-gzip: for faster reading of NIFTI files')
checkdepends=('python-pytest-httpserver')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha512sums=('1af45ecbfd5fe413659cf974f6e6a0fe45c92770f623365b6176642d3a8260a46651b4f95b6dae5a98c8f019fafdb2dce419a2077fe97e43a05dc47468c1c800')

build()
{
  	cd "$srcdir/${_pkgname}-$pkgver"
  	python -m build --wheel --no-isolation
}

# check()
# {
#   	cd "$srcdir/${_pkgname}-$pkgver"
#   	pytest 
# }


package()
{
  	cd "$srcdir/${_pkgname}-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

