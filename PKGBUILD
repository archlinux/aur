# Maintainer: Jose Riha <jose 1711 gmail com>
# Contributor: Dan Serban
# Contributor: mickael9

pkgname=algodoo
pkgver=1.x.x.latest
pkgrel=5
pkgdesc="A physics simulator program for education and fun (based on phun)"
arch=(i686 x86_64)
url=http://www.algodoo.com/
license=(custom:commercial)
depends_i686=(boost-libs curl glew libjpeg6 libpng12 libzip mesa pango sdl_image libcurl-gnutls glew1.5)
depends_x86_64=(${depends_i686[@]} libva gsm schroedinger speex libtheora libvpx libraw1394 lapack jasper)
options=('!strip')

source_i686=('algodoo.desktop' 'http://www.algodoo.com/download/algodoo_1_8_5-Linux32.tgz')
source_x86_64=('algodoo.desktop' 'http://www.algodoo.com/download/algodoo_1_8_5-Linux64.tgz')

md5sums_i686=('c1baec0f7e0ae085a7b41116d7500912'
              'e215e6089b478226f6bf245caa754a6d')
md5sums_x86_64=('c1baec0f7e0ae085a7b41116d7500912'
                'd09fe5baffdc64a3fdcf61e3bcba3d78')


package()
{
  mv Algodoo algodoo
  mkdir -p "${pkgdir}"/usr/share
  mv algodoo "${pkgdir}"/usr/share/
  cd "${pkgdir}"/usr/share/algodoo/lib
  if [ $CARCH == 'i686' ]
        then
          ln -s libcxcore.so libcxcore.so.1
          ln -s libcv.so libcv.so.1
          ln -s libhighgui.so libhighgui.so.1
        else
          rm liblapack.so.3gf
          ln -s libcxcore.so libcxcore.so.2.1
          ln -s libcv.so libcv.so.2.1
          ln -s libhighgui.so libhighgui.so.2.1
          ln -s libzip.so libzip.so.1
          ln -s libtiff.so libtiff.so.4
          ln -s libswscale.so libswscale.so.0
          ln -s /usr/lib/libvpx.so libvpx.so.0
          ln -s /usr/lib/libjasper.so libjasper.so.1
          ln -s /usr/lib/liblapack.so liblapack.so.3gf
          ln -s /usr/lib/libva.so libva.so.1
        fi
  mkdir -p "${pkgdir}"/usr/bin
  cat <<HERE >${pkgdir}/usr/bin/algodoo
#!/bin/sh
export LD_LIBRARY_PATH="/usr/share/algodoo/lib:${LD_LIBRARY_PATH}"
exec /usr/share/algodoo/algodoo.bin
HERE
  chmod +x ${pkgdir}/usr/bin/algodoo
  install -Dm644 $pkgdir/usr/share/algodoo/data/logos/icon.bmp $pkgdir/usr/share/pixmaps/algodoo.bmp
  install -Dm644 $srcdir/algodoo.desktop $pkgdir/usr/share/applications/algodoo.desktop
}
