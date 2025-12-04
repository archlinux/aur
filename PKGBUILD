# Maintainer: Bipin Kumar <kbipinkumar@pm.me>

pkgname=nanoget
_module=nanoget
pkgver=1.19.4
pkgrel=1
pkgdesc="Functions to extract useful metrics from Oxford Nanopore sequencing reads and alignments"
url="https://github.com/wdecoster/nanoget/"
depends=(
         'python'
         'python-pandas'
         'python-numpy'
         'python-biopython'
         'python-pysam'
        )

makedepends=(
             'python-setuptools'
             'python-wheel'
             'python-build'
             'cython'
             'python-installer'
            )
license=('GPL3')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('313e5b6d65bfce258e7c5153ef73ac12d226dad4174072f89820b439196fa2f5')

build() {
  cd ${pkgname}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd ${pkgname}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
  rm ${pkgdir}/usr/LICENSE
}
