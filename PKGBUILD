# Contributor: Marco Pompili (emarcs) <marcs.pompili@gmail.com>
# Maintainer: Marco Pompili (emarcs) <marcs.pompili@gmail.com>

pkgname=daphne
pkgver=1.0
pkgrel=3
pkgdesc="A command-line multiple arcade laserdisc emulator."
url="http://www.daphne-emu.com/"
license=('GPL')
arch=('i686' 'x86_64')
if [ "$CARCH" = "x86_64" ]; then
      depends=('lib32-glew' 'lib32-sdl_mixer' 'lib32-zlib' 'lib32-gcc-libs' 'lib32-libxmu')
    else
      depends=('glew' 'sdl_mixer' 'zlib' 'gcc-libs' 'libxmu')
    fi
source=("http://www.daphne-emu.com/download/${pkgname}-${pkgver}beta-linux.tar.gz" \
        daphne.sh \
        roms.tar.gz)
sha256sums=('924eb8e20362574b2d2be2e09ca8022c7fbd2711bca7914dda9bbdce4f3ea5ac'
            'a44c2c6d3aa44ce88110fd24b7bb390070feb97664c076a75a26fb435d16eb9d'
            '1f98cff4b8688b4fb7f2fa73ac650b5686a4d6ecf73edaa30722ae5a92135e54')

package()
{
  # Install everything in /usr/share
  cd ${srcdir}/${pkgname}
  install -Dm755 ${srcdir}/daphne.sh ${pkgdir}/usr/bin/${pkgname}
  install -Dm755 ${pkgname} ${pkgdir}/usr/share/${pkgname}/${pkgname}
  install -m644 libvldp2.so ${pkgdir}/usr/share/${pkgname}/libvldp2.so
  mkdir   ${pkgdir}/usr/lib
  install -m644 ${srcdir}/${pkgname}/lib/libGLEW.so.1.3 ${pkgdir}/usr/lib/
  install -d ${pkgdir}/usr/share/${pkgname}/{images,pics,roms/cputest,sound}
  install -m644 images/*.jpg ${pkgdir}/usr/share/${pkgname}/images/
  install -m644 pics/* ${pkgdir}/usr/share/${pkgname}/pics/
  install -m644 ${srcdir}/roms/cputest/* ${pkgdir}/usr/share/${pkgname}/roms/cputest/
  install -m644 sound/* ${pkgdir}/usr/share/${pkgname}/sound/
}
