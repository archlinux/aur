# Maintainer: Bipin Kumar <kbipinkumar@pm.me>

pkgname=nanoget
_module=nanoget
pkgver=1.19.1
pkgrel=2
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
sha256sums=('14f4883a995503dbae757b55cb42fcb4430c58ce2201b79abd4e8e0e3d10ca18')

build() {
  cd ${pkgname}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd ${pkgname}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
  rm ${pkgdir}/usr/LICENSE
}
