# Maintainer: ainola
# Contributor: fledge (Giorgio Daino)

pkgname=residualvm
pkgver=0.3.1
pkgrel=4
pkgdesc="A cross-platform 3D game interpreter for LucasArts LUA-based 3D adventures"
arch=('x86_64')
license=('LGPL')
url="http://www.residualvm.org/"
depends=('sdl2' 'libmad' 'libmpeg2' 'libvorbis' 'hicolor-icon-theme'
         'libjpeg-turbo' 'alsa-lib' 'glew' 'freetype2')
optdepends=('fluidsynth: for MIDI SoundFont2 support')
source=("$pkgname-$pkgver.tar.gz::https://github.com/residualvm/residualvm/archive/$pkgver.tar.gz")
sha256sums=('515b02129dd374bc9c0b732ddeaaaa3a342cc25ea0ea3c4ccf19141b5d362e1d')

build() {
    cd "$pkgname-$pkgver"
    ./configure --disable-debug \
                --enable-release \
                --prefix=/usr
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
    install -Dm644 "dists/$pkgname.desktop" -t "$pkgdir/usr/share/applications/"
    install -Dm644 "icons/$pkgname.png" -t "$pkgdir/usr/share/icons/hicolor/256x256/"
    install -Dm644 "icons/$pkgname-big.png" "$pkgdir/usr/share/icons/hicolor/512x512/residualvm.png"
}
