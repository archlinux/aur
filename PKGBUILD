# Maintainer: ConnorBehan <connor.behan@gmail.com>

pkgbase=mesa-dri1
pkgname=('unichrome-dri' 'i810-dri' 'mach64-dri' 'mga-dri' 'r128-dri' 'savage-dri' 'sis-dri' 'tdfx-dri')

pkgver=7.11.2
pkgrel=13
arch=('x86_64')
makedepends=('xorgproto' 'libdrm>=2.4.26' 'libxxf86vm>=1.1.1' 'libxdamage>=1.1.3' 'expat>=2.0.1' 'libx11>=1.4.3' 'libxt>=1.1.1' 
             'gcc-libs>=4.6.1' 'python' 'libxml2' 'imake' 'llvm' 'udev')
url="http://mesa3d.sourceforge.net"
license=('custom')
source=(ftp://ftp.freedesktop.org/pub/mesa/older-versions/7.x/${pkgver}/MesaLib-${pkgver}.tar.bz2
	LICENSE mesa-dri1-symbol-visibility.patch mesa-dri1-python3.patch)
md5sums=('0837c52698fe3252369c3fdb5195afcc'
         '5c65a0fe315dd347e09b1f2826a1df5a'
         '489feaf524440ff2e4fa32e65e7037ce'
         'b1da35125d638bb3ea673cc18ce9f9e3')

build() {
    cd "${srcdir}"/Mesa-7.11.2
    patch -Np1 -i ../mesa-dri1-symbol-visibility.patch
    patch -Np1 -i ../mesa-dri1-python3.patch
    autoreconf -vfi
    ./configure --prefix=/usr \
    --with-dri-driverdir=/usr/lib/xorg/modules/dri \
    --with-dri-drivers=unichrome,i810,mach64,mga,r128,savage,sis,tdfx \
    --with-gallium-drivers= \
    --disable-gallium-llvm \
    --enable-glx-tls \
    --with-driver=dri \
    --enable-xcb \
    --disable-glut \
    --enable-gles1 \
    --enable-gles2 \
    --enable-egl \
    --enable-texture-float \
    --disable-shared-dricore

    make
}

package_unichrome-dri() {
  depends=("expat" "libdrm" "gcc-libs")
  pkgdesc="Mesa DRI drivers for S3 Graphics/VIA Unichrome"
  conflicts=('mesa>=21.0')

  make -C ${srcdir}/?esa-*/src/mesa/drivers/dri/unichrome DESTDIR="${pkgdir}" install
  install -m755 -d "${pkgdir}/usr/share/licenses/unichrome-dri"
  install -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/unichrome-dri/"
}

package_i810-dri() {
  depends=("expat" "libdrm" "gcc-libs")
  pkgdesc="Mesa DRI drivers for Intel i810"
  conflicts=('mesa>=21.0')

  make -C ${srcdir}/?esa-*/src/mesa/drivers/dri/i810 DESTDIR="${pkgdir}" install
  install -m755 -d "${pkgdir}/usr/share/licenses/i810-dri"
  install -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/i810-dri/"
}

package_mach64-dri() {
  depends=("expat" "libdrm" "gcc-libs")
  pkgdesc="Mesa DRI drivers for ATI Mach64"
  conflicts=('xf86-video-mach64<6.8.2' 'mesa>=21.0')

  make -C ${srcdir}/?esa-*/src/mesa/drivers/dri/mach64 DESTDIR="${pkgdir}" install
  install -m755 -d "${pkgdir}/usr/share/licenses/mach64-dri"
  install -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/mach64-dri/"
}

package_mga-dri() {
  depends=("expat" "libdrm" "gcc-libs")
  pkgdesc="Mesa DRI drivers for Matrox"
  conflicts=('xf86-video-mga<1.4.11' 'mesa>=21.0')

  make -C ${srcdir}/?esa-*/src/mesa/drivers/dri/mga DESTDIR="${pkgdir}" install
  install -m755 -d "${pkgdir}/usr/share/licenses/mga-dri"
  install -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/mga-dri/"
}

package_r128-dri() {
  depends=("expat" "libdrm" "gcc-libs")
  pkgdesc="Mesa DRI drivers for ATI Rage128"
  conflicts=('xf86-video-r128<6.8.1' 'mesa>=21.0')

  make -C ${srcdir}/?esa-*/src/mesa/drivers/dri/r128 DESTDIR="${pkgdir}" install
  install -m755 -d "${pkgdir}/usr/share/licenses/r128-dri"
  install -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/r128-dri/"
}

package_savage-dri() {
  depends=("expat" "libdrm" "gcc-libs")
  pkgdesc="Mesa DRI drivers for S3 Sraphics/VIA Savage"
  conflicts=('xf86-video-savage<2.3.1' 'mesa>=21.0')

  make -C ${srcdir}/?esa-*/src/mesa/drivers/dri/savage DESTDIR="${pkgdir}" install
  install -m755 -d "${pkgdir}/usr/share/licenses/savage-dri"
  install -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/savage-dri/"
}

package_sis-dri() {
  depends=("expat" "libdrm" "gcc-libs")
  pkgdesc="Mesa DRI drivers for SiS"
  conflicts=('xf86-video-sis<0.10.2' 'mesa>=21.0')

  make -C ${srcdir}/?esa-*/src/mesa/drivers/dri/sis DESTDIR="${pkgdir}" install
  install -m755 -d "${pkgdir}/usr/share/licenses/sis-dri"
  install -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/sis-dri/"
}

package_tdfx-dri() {
  depends=("expat" "libdrm" "gcc-libs")
  pkgdesc="Mesa DRI drivers for 3dfx"
  conflicts=('xf86-video-tdfx<1.4.3' 'mesa>=21.0')

  make -C ${srcdir}/?esa-*/src/mesa/drivers/dri/tdfx DESTDIR="${pkgdir}" install
  install -m755 -d "${pkgdir}/usr/share/licenses/tdfx-dri"
  install -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/tdfx-dri/"
}
