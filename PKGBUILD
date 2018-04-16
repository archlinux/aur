# Arch User repository PKGBUILD file
# Builds the python interface for the SOFA library
# Maintainer: Roelof Rietbroek <roelof@wobbly.earth>
pkgname=pysofa
pkgver=0.1.1
pkgrel=1
pkgdesc="Python interface to SOFA C library (Standards of Fundamental Astronomy)"
arch=('any')
url="https://code.google.com/archive/p/pysofa/"
license=('SOFA License')
groups=()
depends=("sofa" "python-numpy")
makedepends=()
source=("https://pypi.python.org/packages/f5/fd/557bc955527164df6d5699ba2369415a26767a90e848ce362600435d4553/pysofa-$pkgver.tar.gz"  "octonotationpatch.diff")
noextract=()
md5sums=('962be6439044b4ff666f735b2207aaa8'
         '5e6cef758d9861cba2e72eb2faff3ee4')
validpgpkeys=()

prepare() {
    _startdir=${PWD}
    cd ${srcdir}
    #patch some files to get rid of the octo notation (doesn't work in python 3)
    patch pysofa-${pkgver}/pysofa/pysofa_ctypes.py octonotationpatch.diff
    cd ${_startdir}
}

build() { 
    cd ${srcdir}/pysofa-${pkgver}/
    python ./setup.py build 
    cd ${_startdir}
}


package() {
    cd ${srcdir}/pysofa-${pkgver}/
    python ./setup.py install --root="${pkgdir}/" 
    cd ${_startdir}
}

