# Maintainer: Cecile Tonglet <cecile.tonglet@gmail.com>

pkgname="sdl2-rbp-bin"
pkgver="2.0.3+1rpi"
pkgrel=1
pkgdesc="A library for portable low-level access to video, audio and input (debian binary)"
arch=('arm' 'armv6h' 'armv7h')
url="http://www.libsdl.org"
license=('ZLIB')
provides=('sdl2')
conflicts=('sdl2')
depends=(
  'raspberrypi-firmware-tools' 'alsa-lib' 'glibc' 'libx11' 'libxext'
  'libxcursor' 'libxinerama' 'libxi' 'libxrandr' 'libxss' 'libxxf86vm'
  'libxcb' 'libxrender' 'libxfixes' 'libxau' 'libxdmcp'
)
makedepends=('deb2targz')
source=(
  "http://downloads.petrockblock.com/retropiebinaries/jessie/rpi2/libsdl2-2.0-0_${pkgver}_armhf.deb"
  "http://downloads.petrockblock.com/retropiebinaries/jessie/rpi2/libsdl2-dev_${pkgver}_armhf.deb"
)

md5sums=(
  '16b9a5dd3aef1840208423e317eaf442'
  'ff3fd03b73827e2963430e9f04314c3b'
)

build() {
    deb2targz *.deb >/dev/null || return 1
    rm -f *.deb || return 1
    cd $srcdir || return 1
    for i in *.tar.xz;do tar xfJ $i -C .;done || return 1
}

package() {
    cp -rf $srcdir/usr/ $pkgdir/ || return 1
    mv $pkgdir/usr/lib/arm-linux-gnueabihf/* $pkgdir/usr/lib/ || return 1
    rmdir $pkgdir/usr/lib/arm-linux-gnueabihf || return 1
}
