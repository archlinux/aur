# Maintainer: Johnathan Jenkins <twodopeshaggy@gmail.com>
# Contributor: ksj <podhorsky.ksj@gmail.com>
# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>

_pkgname=avidemux
pkgname=avidemux-2.6
pkgver=2.6.14
pkgrel=0
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
source=('https://dl.dropboxusercontent.com/u/26513012/'$_pkgname'_'$pkgver'.tar.gz')
sha512sums=('c940850df93e77b3176850cfdd7851c1e133835802a2bc979a497d825d85ca2fd394e2dc813242b9009f1b6ec2904f63163bd9afda9478be064518e4572449a1')

build() {
    cd $srcdir/"$_pkgname"_"$pkgver"
    sed -i -e 's/-j 2/-j 1/g' bootStrap.bash
    bash bootStrap.bash   --without-gtk
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
