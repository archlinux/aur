# Maintainer: bipin kumar <bipin@ccmb.res.in>

pkgname=flair
_module=flair-brookslab
pkgver=1.7.0
pkgrel=3
pkgdesc="Tool for correction, isoform definition, and alternative splicing analysis of nanopore cDNA, native RNA, and PacBio sequencing reads"
arch=('any')
url="https://github.com/BrooksLabUCSC/flair"
license=('BSD')
depends=(
         'python'
         'python-numpy'
         'python-tqdm'
         'python-ncls'
         'python-pybedtools'
         'python-mappy'
         'python-pysam'
         'bedtools'
         'samtools'
         'minimap2'
        )
optdepends=(
            'cython'
            'python-pandas'
            'python-rpy2'
            'r'
            'r-ggplot2'
            'r-qqman'
            'r-deseq2'
            'r-drimseq'
            'r-stager'
            'python-matplotlib'
            'python-seaborn'
            )
makedepends=(
             'python-setuptools'
             'cython'
             'python-build'
             'python-installer'
             'python-wheel'
            )

options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
       
sha256sums=('7bc0e88b25d45d1c233495da20a481089376c2f4e01e14530d1e4550da245cdb')

build() {
    cd "$_module-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_module-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
