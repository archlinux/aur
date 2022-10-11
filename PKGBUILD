# Maintainer: Malacology <guoyizhang at malacology dot com>
# Contributor: Malacology <guoyizhang at malacology dot com>

pkgname=beast2
pkgver=2.7.1
pkgrel=1
pkgdesc="Bayesian Evolutionary Analysis by Sampling Trees. https://doi.org/10.1371/journal.pcbi.1003537"
arch=('x86_64')
url="http://www.beast2.org/"
license=('LGPL')
provides=("beast2")
source=("https://github.com/CompEvol/beast2/releases/download/v${pkgver}/BEAST.v${pkgver}.Linux.x86.tgz" "beauti.desktop" "densitree.desktop" "logcombiner.desktop" "treeannotator.desktop" "beast2.desktop" "loganalyser.desktop" "applauncher.desktop")
sha256sums=('959ff0336a0e87637e0381aa88b22c4e9f5929319fcc69e4c5bdfadb18b97eb3'
            '83fba4c776fd29d6852c9c412c31d98bff657e2d2d2763dfe46d4c6174a9495f'
            '40d86086691b6cb91d0af54e5dc53d6693e084242ff3cc77862650ca78667c3d'
            'c2057c6ac656e13dcfbdf580a696bc79cb22c3d5270d546eac3e2fb42d620f20'
            '960a2d9030105156e178fe8fd5a8329cf10af1e16141623da47f649f059906b0'
            'cf09789425aec65601f8dc585a9e5afd0f43af713ce67d8009b18efef5b6edd3'
            'b10a94df8d6c44b270cd8ea6f9af08ac803ff0a210aae602b80bbb99050f5b46'
            '78671538afa07e8efac47eadc845c1616d553e095bf749c0215fdba8af2a2c1b')
depends=('java-runtime=11')
optdepends=('beagle-lib')
package() {
    install -dm755 "$pkgdir"/usr/{bin,share/{beast2,applications}}
    sed -i 's/\/usr\/local\/lib/\/usr\/lib/g'  ${srcdir}/beast/bin/beast
    mv "$srcdir"/beast/* "$pkgdir"/usr/share/beast2
    for bin in $(ls $pkgdir/usr/share/beast2/bin)
do
    ln -s /usr/share/beast2/bin/$bin ${pkgdir}/usr/bin/$bin
done   
    install -m 755 ${srcdir}/*.desktop ${pkgdir}/usr/share/applications
}

