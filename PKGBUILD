# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname='python-pybedtools-git'
pkgver=0.7.10.r21.g7143a86
pkgrel=1
pkgdesc="Python wrapper for Aaron Quinlan's bedtools."
arch=('any')
url="http://daler.github.io/pybedtools"
license=('GPL2')
depends=(
  'python'
  'python-numpy'
  'python-pandas'
  'python-pysam>=0.8.1'
  'python-six')
makedepends=('cython' 'python-setuptools')
optdepends=(
  'bedtools: more-or-less required by namesake'
  'htslib: for working with SAM/BAM/CRAM files'
  'python-matplotlib: for plotting genomic intervals'
  'ucsc-kent-genome-tools: for bedgraph to bigwig conversions')
provides=('python-pybedtools')
conflicts=('python-pybedtools')
options=(!emptydirs)
source=("git+https://github.com/daler/pybedtools.git")
md5sums=('SKIP')

pkgver() {
  cd "pybedtools"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed s'/v//'
}

package() {
  cd "${srcdir}/pybedtools"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
