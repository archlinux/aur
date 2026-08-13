# Maintainer: bipin kumar <kbipinkumar@pm.me>

pkgname=flair
_module=flair-brookslab
pkgver=3.0.1
_tag=v${pkgver}
pkgrel=1
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
             'python-poetry'
             'git'
            )

options=(!emptydirs)
source=($_module-$pkgver::git+https://github.com/BrooksLabUCSC/flair.git#tag=${_tag})

sha256sums=('ea9e2fc49722aa73fad4276d462380c0cf90ae536fa292f8d996b9d73314f530')

build() {
    cd "$_module-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_module-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
