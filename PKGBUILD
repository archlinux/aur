# Maintainer: Mahmut Dikcizgi <boogiepop a~t gmx com>

pkgname=libmali-radxa-g610-bin
pkgver=g6p0_5_01eac0
pkgrel=3
blobcommit="25e4250de1c539d23c67a74f69273130fe88b4a3"
fwcommit="25e4250de1c539d23c67a74f69273130fe88b4a3"
pkgdesc='Binary libmali g610 drivers for X and Wayland and firmware for panfork/mesa for Radxa Rock5b'
arch=('aarch64')
url='https://github.com/JeffyCN/rockchip_mirrors/tree/libmali/'
depends=('coreutils' 'mesa' 'dri2to3' 'gl4es' 'chrpath')
options=(!lto !strip)
source=("libmali_g610_wayland.so::https://github.com/JeffyCN/rockchip_mirrors/raw/${blobcommit}/lib/aarch64-linux-gnu/libmali-valhall-g610-g6p0-wayland-gbm.so"
        "libmali_g610_x.so::https://github.com/JeffyCN/rockchip_mirrors/raw/${blobcommit}/lib/aarch64-linux-gnu/libmali-valhall-g610-g6p0-x11-gbm.so"
        "https://github.com/JeffyCN/rockchip_mirrors/raw/${fwcommit}/firmware/g610/mali_csffw.bin"
        "libmali"
        "libmaliw")
sha256sums=('b0794cc1e4daf0c19f0f947eaad100d87cf472a9c7ae1d1b206c156b129e0c41'
            '3d57cb76dca851c876a3ff71c49febd5bfc00fc1501f46ed37df33e75ebcb99b'
            '9e9cede2cb8f45228216f39259552ac886950be9daf59e2591c73bde60010699'
            'b84ee1260ca933caa14d524ed2b44500aac0fade0dc15e7f1b92df2dde1ccd11'
            '400775e8529a0a43cb138c57c87138cca6865db4db6ee3adefb0c599c91e27c7')

package() {
  	provides=(libmali $pkgname)
  	conflicts=(libmali $pkgname)

	# install the firmware
  	install -Dm755 mali_csffw.bin $pkgdir/usr/lib/firmware/mali_csffw.bin

	# install blob drivers
  	for d in x wayland; do
  	  	install -Dm755 libmali_g610_$d.so $pkgdir/usr/lib/libmali/libmali_g610_$d.so
  	    install -dm755 $pkgdir/usr/lib/libmali/$d
  	    for l in libEGL.so libEGL.so.1 libgbm.so.1 libGLESv2.so libGLESv2.so.2 libGLESv2_CM.so libOpenCL.so.1; do
  	        ln -s ../libmali_g610_$d.so $pkgdir/usr/lib/libmali/$d/$l;
  	    done
  	done
  	
  	# install the helper scripts
  	install -Dm755 libmali $pkgdir/usr/bin/libmali
  	install -Dm755 libmaliw $pkgdir/usr/bin/libmaliw
}
