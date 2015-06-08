# Maintainer: Daniel Reuter <daniel.robin.reuter@googlemail.com>
pkgname=ocrmypdf
pkgver=2.1.0
pkgrel=1
pkgdesc="OCRmyPDF adds an OCR text layer to scanned PDF files, allowing them to be searched."
url="https://github.com/fritz-hh/OCRmyPDF"
arch=('any')
license=('custom')
depends=('java-environment' 'bc' 'imagemagick' 'parallel' 'poppler' 'pdftk' 'unpaper' 'tesseract' 'python2-reportlab' 'python2-lxml' 'python2-imaging' 'ghostscript')
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
#install='ocrmypdf.install'
source=("https://github.com/fritz-hh/OCRmyPDF/archive/v2.1-stable.tar.gz"
	"ocrmypdf.patch")
sha256sums=('b6d673585bd68b6daad6f71b827786c949e5951cd379aa4b121f193b4fefba98'
            '32bc9749d05f17932071ba07fde063b66712ab5a33bbb83de0fc03fcd87f4adc')

build() {
    echo "Applying patches"
    cd "${srcdir}/OCRmyPDF-2.1-stable"
    patch -p1 -i $srcdir/ocrmypdf.patch
}

package() {
    cd "${srcdir}/OCRmyPDF-2.1-stable"
    # --- jhove ---
    install -Dm755 jhove/configure.pl $pkgdir/usr/lib/jhove/configure.pl
    install -Dm755 jhove/jhove $pkgdir/usr/lib/jhove/jhove
    install -Dm755 jhove/jhove.tmpl $pkgdir/usr/lib/jhove/jhove.tmpl
    install -Dm755 jhove/build.xml $pkgdir/usr/lib/jhove/build.xml
    install -Dm644 jhove/conf/jhove-byteoffset=true.conf $pkgdir/usr/lib/jhove/conf/jhove-byteoffset=true.conf
    install -Dm644 jhove/conf/README $pkgdir/usr/lib/jhove/conf/README
    install -Dm644 jhove/conf/jhove-withTextMD.conf $pkgdir/usr/lib/jhove/conf/jhove-withTextMD.conf
    install -Dm644 jhove/conf/jhove.conf $pkgdir/usr/lib/jhove/conf/jhove.conf
    install -Dm755 jhove/md5.pl $pkgdir/usr/lib/jhove/md5.pl
    install -Dm755 jhove/j2dump $pkgdir/usr/lib/jhove/j2dump
    install -Dm755 jhove/userhome $pkgdir/usr/lib/jhove/userhome
    install -Dm755 jhove/lib/PngModule.jar $pkgdir/usr/lib/jhove/lib/PngModule.jar
    install -Dm755 jhove/lib/OdfModule.jar $pkgdir/usr/lib/jhove/lib/OdfModule.jar
    install -Dm755 jhove/packagejhove.sh $pkgdir/usr/lib/jhove/packagejhove.sh
    install -Dm755 jhove/pdump $pkgdir/usr/lib/jhove/pdump
    install -Dm755 jhove/jhove_bat.tmpl $pkgdir/usr/lib/jhove/jhove_bat.tmpl
    install -Dm755 jhove/bin/JhoveView.jar $pkgdir/usr/lib/jhove/bin/JhoveView.jar
    install -Dm755 jhove/bin/jhove-handler.jar $pkgdir/usr/lib/jhove/bin/jhove-handler.jar
    install -Dm644 jhove/bin/README $pkgdir/usr/lib/jhove/bin/README
    install -Dm755 jhove/bin/jhove.jar $pkgdir/usr/lib/jhove/bin/jhove.jar
    install -Dm755 jhove/bin/jhove-module.jar $pkgdir/usr/lib/jhove/bin/jhove-module.jar
    install -Dm755 jhove/bin/JhoveApp.jar $pkgdir/usr/lib/jhove/bin/JhoveApp.jar
    install -Dm755 jhove/jdump $pkgdir/usr/lib/jhove/jdump
    install -Dm755 jhove/gdump $pkgdir/usr/lib/jhove/gdump
#     install -Dm644 jhove/LICENSE $pkgdir/usr/lib/jhove/LICENSE
#     install -Dm644 jhove/COPYING $pkgdir/usr/lib/jhove/COPYING
    
    # --- OCRmyPDF ---
    install -Dm755 src/ocrPage.sh $pkgdir/usr/lib/ocrmypdf/src/ocrPage.sh
    install -Dm755 src/hocrTransform.py $pkgdir/usr/lib/ocrmypdf/src/hocrTransform.py
    install -Dm755 OCRmyPDF.sh $pkgdir/usr/bin/OCRmyPDF.sh
    install -Dm755 src/config.sh $pkgdir/etc/ocrmypdf.sh
    install -Dm644 LICENSE.md $pkgdir/usr/share/licenses/$pkgname/LICENSE.md
}

# vim:set ts=2 sw=2 et:
