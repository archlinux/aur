# Maintainer: John Jenkins <twodopeshaggy@gmail.com>
# Contributor: ksj <podhorsky.ksj@gmail.com>
# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>

_pkgname=avidemux
pkgname=avidemux-2.6
pkgver=2.6.9
pkgrel=2
pkgdesc="A graphical tool to edit video (filter/re-encode/split)"
arch=(i686 x86_64)
url=http://fixounet.free.fr/avidemux/
license=(GPL2)
depends=(twolame qt5-tools opencore-amr jack flac x264 x265 xvidcore sqlite libpulse libva libvdpau faac faad2 lame libdca fribidi libvpx fontconfig glu qt5-base)
makedepends=(cmake yasm sdl libxv jack libsamplerate freetype2 libxext libxml2 pkg-config)
optdepends=(libvorbis sdl alsa-lib libxv)
conflicts=('avidemux' 'avidemux-cli' 'avidemux-gtk' 'avidemux-qt' 'avidemux-git')
provides=($pkgname=$pkgver)
options=('!makeflags')
source=(http://sourceforge.net/projects/avidemux/files/avidemux/"$pkgver"/"$_pkgname"_"$pkgver".tar.gz)
sha256sums=('c073bdb966bc0ab0dc3bbc7b5119fb81509b9d6cd90b916183a99ec6627e5006')
sha512sums=('5607eeb87e00d796fe333026f4cbd161b2be32271179c4e6fdee2a8c07a754f0fade6f0d696dac7844df774e984f0dd6083c4a694422f1ecf94711eb7b1f434c')

build() {
    cd $srcdir/"$_pkgname"_"$pkgver"
    bash bootStrap.bash   --enable-qt5
    sed -i -e 's/avidemux2_gtk/avidemux3_qt5/g' "$_pkgname"2.desktop
    sed -i -e 's/avidemux2/avidemux/g' "$_pkgname"2.desktop
}

package() {
    cd $srcdir/"$_pkgname"_"$pkgver"/install
    cp -R usr/ "$pkgdir"/

    cd $srcdir/"$_pkgname"_"$pkgver"
    install -Dm644 "$_pkgname"_icon.png "$pkgdir"/usr/share/pixmaps/avidemux.png
    install -Dm644 "$_pkgname"2.desktop "$pkgdir"/usr/share/applications/avidemux.desktop

}
