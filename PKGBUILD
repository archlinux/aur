# Maintainer: Cecile Tonglet <cecile.tonglet@gmail.com>

# To determine the URL and the version available, blame on the repository
# https://github.com/RetroPie/RetroPie-Setup on file
# scriptmodules/supplementary/sdl2.sh at line ~23 in function
# get_pkg_ver_sdl2. You will get at least the number after the + and maybe
# a hint in the comment of the last commit.

pkgname="sdl2-rbp-bin"
pkgver="2.0.8+1rpi"
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
source=(
	"http://files.retropie.org.uk/binaries/jessie/rpi2/libsdl2-2.0-0_${pkgver}_armhf.deb"
	"http://files.retropie.org.uk/binaries/jessie/rpi2/libsdl2-dev_${pkgver}_armhf.deb"
)
noextract=(
	"libsdl2-2.0-0_${pkgver}_armhf.deb"
	"libsdl2-dev_${pkgver}_armhf.deb"
)
md5sums=(
	'200a2fd711d29f8093caf45010bdd65d'
	'6a1f1d168ffbc30cb9e55a812d93a997'
)

package() {
	bsdtar -O -x -f libsdl2-2.0-0_${pkgver}_armhf.deb data.tar.xz | bsdtar -x -f - -C "$pkgdir"
	test -e "$pkgdir/usr/lib" || (echo missing usr/lib; return 1)
	bsdtar -O -x -f libsdl2-dev_${pkgver}_armhf.deb data.tar.xz | bsdtar -x -f - -C "$pkgdir"
	test -e "$pkgdir/usr/include" || (echo missing usr/include; return 1)
	mv "$pkgdir"/usr/lib/arm-linux-gnueabihf/* "$pkgdir"/usr/lib/ || return 1
	rmdir $pkgdir/usr/lib/arm-linux-gnueabihf || return 1
}
