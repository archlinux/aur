# Maintainer: bipin kumar <kbipinkumar@pm.me>

pkgname=flair
_module=flair-brookslab
pkgver=3.0.0
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

sha256sums=('2ccf517ab05b483ab54621a72c63e602d2e36a3110cc74a5584bb1f7bf75538f')

build() {
    cd "$_module-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_module-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
