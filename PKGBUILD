# Maintainer: John Jenkins <twodopeshaggy@gmail.com>
# Contributor: ksj <podhorsky.ksj@gmail.com>
# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>

_pkgname=avidemux
pkgname=avidemux-2.6
pkgver=2.6.12
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
sha512sums=('ca5a03eae6bb583d20499da68400645cc7b66c27255fc77f18ffe311d3d27eaaf3ca813aff25a54934d76fe5d10d9fb48b2ad30d662377764f3ec1b620d5a824')

build() {
    cd $srcdir/"$_pkgname"_"$pkgver"
    sed -i -e 's/-j 2/-j 1/g' bootStrap.bash
    bash bootStrap.bash   --without-gtk --enable-qt5
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
