# Maintainer: Thomas Roos <mail [at] thomasroos.nl>
# Co-maintainer: Liam Timms <timms5000@gmail.com>
# Contributor: wedjat <wedjat@protonmail.com>
# Contributor: Masoud <mpoloton@gmail.com>

_pkgname=nibabel
pkgname=python-$_pkgname
pkgver=5.0.0
pkgrel=4
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
sha512sums=('2275be8a6ef7a48d69dfc23c159da6afabde2c57bb50e6966c8ffd0d5cd7f73e9d81635c83ff910a302c8c7d8d394c023783357678c616e14a83b5996c109061')

build()
{
  	cd "$srcdir/${_pkgname}-$pkgver"
  	python -m build --wheel --no-isolation
}

check()
{
  	cd "$srcdir/${_pkgname}-$pkgver"
  	pytest
}


package()
{
  	cd "$srcdir/${_pkgname}-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

