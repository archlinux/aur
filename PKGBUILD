# Maintainer: Michael Schubert <mschu.dev at gmail>
# Contributor: Giulio Guzzinati <guzzinati.giulio at gmail>
pkgname=imagej
pkgver=1.54t
_pkgver=154
_jar=ij-$pkgver.jar
pkgrel=1
epoch=2
pkgdesc="Image manipulation software for scientists"
arch=('any')
url="https://imagej.net"
license=('LicenseRef-Public-Domain' 'LGPL-3.0-or-later')
depends=('java-runtime')
makedepends=('unzip')
optdepends=('java-environment-common')
source=("https://wsr.imagej.net/distros/cross-platform/ij$_pkgver.zip"
        "$_jar::https://wsr.imagej.net/jars/ij.jar"
        "imagej.sh"
        "imagej.desktop"
        "microscope.xpm"
        "LICENSE")
noextract=("ij$_pkgver.zip" "$_jar")
sha256sums=('f13e6d39ae0ac1e2635347e47d597df43716f68608221b819226559b8efa2450'
            'bd05a0bb99792ed8ec5f5b6139e2130d8d0b1767526a9ea529ef64460968710e'
            'c223a3b2437501edd92176f87bbea75d994104e1545eea6c120ef8c774c7114e'
            '799188b0b2cf1dc684dc2f029dbd31a4b44b691b51fd5e42027a994452bc038e'
            'fd1479568b116a276ca1f645589a8e37ccaf767736c6cc0dcec9672225a82572'
            '3e087080e641a38fe499b9192a8ccd6b3b7d507e57f3f32865b9721d7cd6068e')

package() {
    cd "$pkgdir"
    unzip -d "$pkgdir" "$srcdir/ij$_pkgver.zip"
    rm -rf ImageJ/ImageJ.exe ImageJ/ImageJ.app ImageJ/run

    mkdir -p "$pkgdir"/usr/share
    mv ImageJ "$pkgdir"/usr/share/imagej
    install -m644 "$srcdir"/$_jar "$pkgdir"/usr/share/imagej/ij.jar

    find "$pkgdir" -type d -exec chmod 755 {} \; -o -exec chmod 644 {} \;

    cd "$srcdir"
    install -Dm755 imagej.sh "$pkgdir"/usr/bin/imagej
    install -Dm644 imagej.desktop "$pkgdir"/usr/share/applications/imagej.desktop
    install -Dm644 microscope.xpm "$pkgdir"/usr/share/pixmaps/microscope.xpm
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
