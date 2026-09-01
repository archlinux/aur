# Maintainer: Bipin Kumar <kbipinkumar@pm.me>

pkgname=nanoget
_module=nanoget
pkgver=1.19.6
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
sha256sums=('f900c187967af06c491cb92edc017e18b914d1c02e6d0333de2fb9a78738b6fb')

build() {
  cd ${pkgname}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd ${pkgname}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
  rm ${pkgdir}/usr/LICENSE
}
