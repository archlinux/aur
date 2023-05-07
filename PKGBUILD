# Maintainer: Malacology <guoyizhang at malacology dot net>
# Contributor: Malacology <guoyizhang at malacology dot net>

pkgname=easycodeml
pkgver=1.41
pkgrel=1
pkgdesc="A visual tool for analysis of selection using CodeML. https://doi.org/10.1002/ece3.5015"
arch=('x86_64')
url="https://github.com/BioEasy/EasyCodeML"
license=('LGPL3')
source=("https://raw.githubusercontent.com/BioEasy/EasyCodeML/master/EasyCodeML.jar"
	"https://raw.githubusercontent.com/BioEasy/EasyCodeML/master/Custom/codeml.ctl"
	"https://raw.githubusercontent.com/BioEasy/EasyCodeML/master/Custom/default.ctl"
	"https://github.com/BioEasy/EasyCodeML/raw/master/Preset/chi2.exe"
	"https://github.com/BioEasy/EasyCodeML/raw/master/Preset/codeml.exe"
	"easycodeml.desktop"
	"EasyCodeML.png")
sha256sums=('2bc44d3997dd020f2e7c8e03d8b03c1f73804656d66a7dbab7e71deb97377644'
            '2a369a9497cf9435322dc2dad32787f0178685d483ed12aa407e7702b68071a1'
            'b665482ad39736725dbf8b21081ddb9761c7e35c68fc93860889bd52b2429756'
            '3f6e8b9fcfb161d7e920bf3958b6820ad2a8cdb666b3faa4cf538d14e3ba0428'
            'f5884da79e69c972570225a2f2562e43c47f2935b4dd858aae4789440b691adb'
            'e20af3e0e14be4f95d634bf5c34cb35dc37edfada7d97f9c0e9dd10afa7cbf6f'
            '5393db9477bd071511788ea6255c49005274b4aebe792a7631eaa296ada14987')
depends=(
	'java-runtime'
	'paml'
)
package() {
    install -dm755 "$pkgdir"/usr/share/{EasyCodeML/{Custom,Preset,CodeMLSrc/Linux},applications}
    install -Dm 755 "$srcdir"/EasyCodeML.jar "$pkgdir"/usr/share/EasyCodeML
    install -Dm 755 $srcdir/*.ctl "$pkgdir"/usr/share/EasyCodeML/Custom/
for bin in chi2 codeml
do
    ln -s /usr/bin/$bin $pkgdir/usr/share/EasyCodeML/CodeMLSrc/Linux/$bin.exe
    install -Dm 777 $srcdir/$bin.exe $pkgdir/usr/share/EasyCodeML/Preset/$bin.exe
done
    install -m 755 ${srcdir}/EasyCodeML.png ${pkgdir}/usr/share/EasyCodeML/EasyCodeML.png
    install -m 755 ${srcdir}/easycodeml.desktop ${pkgdir}/usr/share/applications/easycodeml.desktop 
}
