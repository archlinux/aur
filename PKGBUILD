# Maintainer: sTiKyt <stikyt@protonmail.com>
pkgname=draquet-polyglot-bin
pkgver=3.5.1
pkgrel=1

pkgdesc="PolyGlot is a conlang construction toolkit"
arch=('x86_64')
url="http://draquet.github.io/PolyGlot/index.html"
license=('MIT')
depends=('alsa-lib' 'freetype2' 'glibc' 'libpng' 'libx11' 'libxau' 'libxcb' 'libxdmcp' 'libxext' 'libxi' 'libxrender' 'libxtst' 'zlib')
makedepends=('git' 'xz' 'tar')
provides=('draquet-polyglot')
install=
source=("${pkgname}-${pkgver}-${pkgrel}.deb::https://github.com/DraqueT/PolyGlot/releases/download/${pkgver}/PolyGlot-Ins-Lin.deb")
md5sums=('49ed5f7c0547cfa5420eeb3c979a1617')

desktopname=draquet-polyglot.desktop

prepare() {
	cd "$srcdir"
        tar -xf data.tar.xz
}

build() {
        # Generate .desktop entry
        echo "[Desktop Entry]" > $desktopname
        echo "Name=PolyGlot" >> $desktopname
        echo "Comment=${pkgdesc}" >> $desktopname
        echo "Icon=draquet-polyglot" >> $desktopname
        echo "Exec=PolyGlot" >> $desktopname
        echo "Type=Application" >> $desktopname
        echo "Encoding=UTF-8" >> $desktopname
        echo "Terminal=false" >> $desktopname
        echo "Categories=Development;Science;Translation;Dictionary;TextTools;Languages;" >> $desktopname
}

package() {
	      # Install PolyGlot to necessary folders
        install -Dm755 $srcdir/opt/polyglot-linear-a/bin/PolyGlot "$pkgdir/usr/bin/PolyGlot"
        install -Dm644 $srcdir/opt/polyglot-linear-a/share/doc/copyright "$pkgdir/usr/share/doc/copyright"
        mkdir -p "$pkgdir/usr/lib/"
        cp -r $srcdir/opt/polyglot-linear-a/lib/* "$pkgdir/usr/lib/"

        # Install Icon
        install -Dm644 $srcdir/opt/polyglot-linear-a/lib/application-zip.png "$pkgdir/usr/share/pixmaps/draquet-polyglot.png"
        # Install .desktop entry
        install -Dm644 $srcdir/$desktopname "$pkgdir/usr/share/applications/${desktopname}"
}
