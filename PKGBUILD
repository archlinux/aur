# Maintainer: Bipin Kumar <bipin@ccmb.res.in>
# Contributor: Clint Valentine <valentine.clint@gmail.com>
pkgname=python-pybedtools
_base=${pkgname#python-}
pkgver=0.9.0
pkgrel=2
pkgdesc="python wrapper for BEDTools bioinformatics suite"
arch=('x86_64')
url="https://github.com/daler/pybedtools"
license=(GPL2)
depends=('bedtools' 'python-numpy' 'python-pandas' 'python-pysam' 'python-six')
makedepends=('cython' 'python-setuptools' 'python-pytest' 'python-pyaml' 'python-yaml' 'python-numpydoc' 'python-sphinx')
optdepends=(
  'htslib: for working with SAM/BAM/CRAM files'
  'python-matplotlib: for plotting genomic intervals'
  'ucsc-genome-browser: for bedgraph to bigwig conversions')
provides=('python-pyvcf')
conflicts=('python-pyvcf')
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('017a2fd3d6d11c26437af0898c5bfa354210d24747e510e5cbbc0584a355cd4b12c123e7b39dc6f6e386608ec0142b37026928d239b085277b79eba91c9a3361')

build() {
  cd "${_base}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_base}-${pkgver}"
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
