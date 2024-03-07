# Maintainer: Thomas Roos <mail [at] thomasroos.nl>
# Co-maintainer: Liam Timms <timms5000@gmail.com>
# Contributor: wedjat <wedjat@protonmail.com>
# Contributor: Masoud <mpoloton@gmail.com>

_pkgname=nibabel
pkgname=python-$_pkgname
pkgver=5.2.1
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
sha512sums=('c5cafed575cc25189649c3e8057fcbd7084d4ed9c4dd10c3d389019808f3cc1f5e7753ed654685c8ff461c2aa8637b7e71e9491ca4f92b9b54fee3224f635072')

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

