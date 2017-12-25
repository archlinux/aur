# Maintainer: Cecile Tonglet <cecile.tonglet@gmail.com>

# To determine the URL and the version available, blame on the repository
# https://github.com/RetroPie/RetroPie-Setup on file
# scriptmodules/supplementary/sdl2.sh at line ~23 in function
# get_pkg_ver_sdl2. You will get at least the number after the + and maybe
# a hint in the comment of the last commit.

pkgname="sdl2-rbp-bin"
pkgver="2.0.7+2rpi"
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
  "http://files.retropie.org.uk/binaries/jessie/rpi2/libsdl2-2.0-0_${pkgver}_armhf.deb"
  "http://files.retropie.org.uk/binaries/jessie/rpi2/libsdl2-dev_${pkgver}_armhf.deb"
)

md5sums=(
  '3d39db04765be92b942f94ab2e94d9a5'
  'ed4d0c3ff122fcd78cae54a3878660a2'
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
