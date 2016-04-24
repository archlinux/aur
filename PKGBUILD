# Maintainer: Michael Schubert <mschu.dev at gmail>
# Contributor: Giulio Guzzinati <guzzinati.giulio at gmail>

pkgname=imagej
pkgver=1.50h
_pkgver=149
pkgrel=1
epoch=2
pkgdesc="Image manipulation software for scientists"
arch=('any')
url="http://rsbweb.nih.gov/ij/index.html"
license=('Public Domain')
depends=('java-runtime')
makedepends=('unzip')
optdepends=('java-environment-common')
source=("http://rsbweb.nih.gov/ij/download/zips/ij$_pkgver.zip"
        "http://imagej.nih.gov/ij/upgrade/ij.jar"
        "imagej.sh"
        "imagej.desktop"
        "microscope.xpm")
noextract=("ij$_pkgver.zip")
md5sums=('a0998c0e6aec078a8f9681f5088c41f2'
         'cf46d5ad93192317ef6545a73e91d497'
         '7dc3fd02120f699204b3d85a7e383082'
         '9d60878b6adad0e1895ce875bf299147'
         'e7a7cef1b44ad3a8752ba63885fd88fb')

package() {
    cd "$pkgdir"
    unzip -d "$pkgdir" "$srcdir/ij$_pkgver.zip"
    rm -rf ImageJ/ImageJ.exe ImageJ/ImageJ.app ImageJ/run 

    mkdir -p "$pkgdir"/usr/share
    mv ImageJ "$pkgdir"/usr/share/imagej
    install -m644 "$srcdir"/ij.jar "$pkgdir"/usr/share/imagej/ij.jar

    find "$pkgdir" -type d -exec chmod 755 {} \; -o -exec chmod 644 {} \;

    cd "$srcdir"
    install -Dm755 imagej.sh "$pkgdir"/usr/bin/imagej
    install -Dm644 imagej.desktop "$pkgdir"/usr/share/applications/imagej.desktop
    install -Dm644 microscope.xpm "$pkgdir"/usr/share/pixmaps/microscope.xpm
}
