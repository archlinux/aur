# Maintainer: Bipin Kumar <kbipinkumar@pm.me>

pkgname=nanoget
pkgver=1.16.1
pkgrel=1
pkgdesc="Functions to extract information from Oxford Nanopore sequencing data and alignments"
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
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/wdecoster/nanoget/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('66e30487859a2e2371fbf5546a2dd555c7f275b26e08821f84fbc848120cd459')

build() {
  cd ${pkgname}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd ${pkgname}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
  rm ${pkgdir}/usr/LICENSE
}
