# Maintainer: Michael Schubert <mschu.dev at gmail>
# Contributor: Giulio Guzzinati <guzzinati.giulio at gmail>
pkgname=imagej
pkgver=1.50j # https://wsr.imagej.net/src/
_pkgver=150
pkgrel=1
epoch=2
pkgdesc="Image manipulation software for scientists"
arch=('any')
url="https://imagej.net"
license=('Public Domain')
depends=('java-runtime')
makedepends=('unzip')
optdepends=('java-environment-common')
source=("http://wsr.imagej.net/distros/cross-platform/ij$_pkgver.zip"
        "https://wsr.imagej.net/jars/ij.jar"
        "imagej.sh"
        "imagej.desktop"
        "microscope.xpm")
noextract=("ij$_pkgver.zip")
md5sums=('a2e52e97b1c683cb4f614b4d570fb972'
         'a659180b574f80d2704dc1b60a8f19a1'
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
