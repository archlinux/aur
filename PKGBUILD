# Contributor: Marco Pompili (emarcs) <marcs.pompili@gmail.com>
# Maintainer: Marco Pompili (emarcs) <marcs.pompili@gmail.com>

pkgname=daphne
pkgver=1.0
pkgrel=2
pkgdesc="A command-line multiple arcade laserdisc emulator."
url="http://www.daphne-emu.com/"
license="GPL"
arch=('i686' 'x86_64')
if [ "$CARCH" = "x86_64" ]; then
      depends=('lib32-glew' 'lib32-sdl_mixer' 'lib32-zlib' 'lib32-gcc-libs' 'lib32-libxmu')  
    else
      depends=('glew' 'sdl_mixer' 'zlib' 'gcc-libs' 'libxmu')
    fi
source=("http://www.daphne-emu.com/download/${pkgname}-${pkgver}beta-linux.tar.gz" \
        daphne.sh \
        roms.tar.gz)
md5sums=('a7812a93bc19fe9ec4cd0a1a7066c71f' '3db2aff0763ec628d10e0cc09a27e2f5'\
	'4f42811b7f71b1d0f23422ad2894f25d')

package()
{
  # Install everything in /usr/share
  cd ${startdir}/src/${pkgname}
  install -Dm755 ${startdir}/src/daphne.sh ${startdir}/pkg/usr/bin/${pkgname}
  install -Dm755 ${pkgname} ${startdir}/pkg/usr/share/${pkgname}/${pkgname}
  install -m644 libvldp2.so ${startdir}/pkg/usr/share/${pkgname}/libvldp2.so
  mkdir   ${startdir}/pkg/usr/lib
  install -m644 ${startdir}/src/${pkgname}/lib/libGLEW.so.1.3 ${startdir}/pkg/usr/lib/
  install -d ${startdir}/pkg/usr/share/${pkgname}/{images,pics,roms/cputest,sound}
  install -m644 images/*.jpg ${startdir}/pkg/usr/share/${pkgname}/images/
  install -m644 pics/* ${startdir}/pkg/usr/share/${pkgname}/pics/
  install -m644 ${startdir}/src/roms/cputest/* ${startdir}/pkg/usr/share/${pkgname}/roms/cputest/
  install -m644 sound/* ${startdir}/pkg/usr/share/${pkgname}/sound/
}
