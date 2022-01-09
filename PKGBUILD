# Maintainer: Clint Valentine <valentine.clint@gmail.com>
_base=pybedtools
pkgname=python-${_base}
pkgver=0.8.2
pkgrel=1
pkgdesc="Wrapper around BEDTools for bioinformatics work"
arch=('any')
url="https://github.com/daler/${_base}"
license=(GPL2)
depends=(bedtools python-pandas python-pysam)
makedepends=(cython)
optdepends=(
  'htslib: for working with SAM/BAM/CRAM files'
  'python-matplotlib: for plotting genomic intervals'
  'ucsc-kent-genome-tools: for bedgraph to bigwig conversions')
provides=('python-pyvcf')
conflicts=('python-pyvcf')
# options=(!emptydirs)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('82af299ec90ce3c80922c82146d0fe26897c243d08d0abc452c667f7183bc89c0f806427fb6691f730c4ddfe8f93e04f59d64b4911297bc30dcbf83a6716cd6d')

build() {
  cd "${_base}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_base}-${pkgver}"
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
