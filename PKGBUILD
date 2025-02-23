# Maintainer: pika02 <pikakolendo02 at gmail dot com>
# Contributor: Guoyi Zhang <GuoyiZhang at malacology dot net>
# Contributor: Matthijs Tadema <M dot J dot Tadema at pm dot me>
# Contributor: Jens Staal <staal1978@gmail.com>

pkgname=ugene-bin
pkgver=52.0
pkgrel=2
pkgdesc="A free cross-platform genome analysis suite (binary release)"
arch=('x86_64')
url="http://ugene.net"
license=('GPL')
depends=('gcc-libs' 'glib2' 'libglvnd' 'libx11' 'libxcb' 'zlib' 'libxtst' 'glu' 'desktop-file-utils')
optdepends=('alsa-lib' 'libjpeg-turbo' 'cufflinks' 'bowtie' 'clustalw' 'phyml' 'blast+' 'clustal-omega' 'vcftools' 'mrbayes' 'bwa' 'bedtools' 'tcoffee' 'hmmer' 'snpeff' 'samtools' 'mafft' 'trimmomatic' 'stringtie' 'kraken' 'diamond-aligner' 'python2-cutadapt' 'python' 'java-runtime' 'bowtie2' 'tophat' 'fastqc')
provides=('ugene')
conflicts=('ugene-git' 'ugene' 'ugene-cuda')
source=("https://github.com/ugeneunipro/ugene/releases/download/${pkgver}/ugene-${pkgver}-linux-x86-64.tar.gz" "ugene.desktop" "ugene.svg")
sha256sums=('5438a6e66a058dfa6fcfe25a08a757adcc6c9b5ce6beb95bb2ff7d8f8aedd645'
            '58aeee982faa07913c016323cdded0a4022695c4e313954fdc09c36742013896'
            '5a159437635965cae796c968c7297fd098e7f86dcecbe6a97e62950e782641fc')

package() {
    mkdir -p "${pkgdir}/usr/"{bin,share/{applications,icons,ugene}}
    install -D -m 755 ugene.svg "${pkgdir}/usr/share/icons/ugene.svg"
    cd "$srcdir/ugene-$pkgver"
    chmod +x *
    mv * $pkgdir/usr/share/ugene
    ln -s /usr/share/ugene/ugene "$pkgdir"/usr/bin/ugene
    install -D -m 755 ${srcdir}/*.desktop "${pkgdir}/usr/share/applications"
}
