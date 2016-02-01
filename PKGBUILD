# Maintainer: John Jenkins <twodopeshaggy@gmail.com>
# Contributor: ksj <podhorsky.ksj@gmail.com>
# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>

_pkgname=avidemux
pkgname=avidemux-2.6
pkgver=2.6.11
pkgrel=1
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
source=(https://dl.dropboxusercontent.com/u/26513012/"$_pkgname"_"$pkgver".tar.gz)
sha512sums=('623944125e46ed1d9e8f5a18dd4094f40a2ca20e40dc6be644533cc8f99318fa062094e351be6fe5a769d93ec651d82c52774ac97bcc669d74afecac69c8d2c8')

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
