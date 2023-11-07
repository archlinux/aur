# Maintainer: Albert Graef <aggraef at gmail dot com>

pkgname=showmidi
_pkgname=ShowMIDI
pkgver=0.1.0
pkgrel=1
pkgdesc="Multi-platform GUI application to effortlessly visualize MIDI activity"
arch=("i686" "x86_64")
license=('GPLv3')
url="https://github.com/gbevin/ShowMIDI"
depends=('alsa-lib' 'freetype2' 'libxrandr' 'libxinerama' 'libxcursor')
makedepends=('pkg-config')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/gbevin/$_pkgname/archive/$pkgver.tar.gz")
md5sums=('e640f4c2151eb43e551fc142b2574373')

build() {
    cd $srcdir/$_pkgname-$pkgver/Builds/LinuxMakefile
    make CONFIG=Release
}

package() {
    # Desktop entry & pixmaps
    install -Dm644 "$srcdir/../$pkgname.desktop" "${pkgdir}/usr/share/applications/$pkgname.desktop"
    install -Dm644 "$srcdir/$_pkgname-$pkgver/Assets/appicon.png" "${pkgdir}/usr/share/pixmaps/$pkgname.png"

    install -Dm755 -T "$srcdir/$_pkgname-$pkgver/Builds/LinuxMakefile/build/showmidi" "${pkgdir}/usr/bin/showmidi"
}
