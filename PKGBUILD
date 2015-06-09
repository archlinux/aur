# Maintainer: Alexej Magura <agm2819*gmail*>
# Contributor: Swen Simon <swsimon at gmail dot com>

pkgname=epsxe-plugin-gpu-mesagl
pkgver=1.78
pkgrel=3
pkgdesc="Accelerated MesaGL plugin"
url="http://www.pbernert.com"
[ "$CARCH" == "i686" ] && depends=('epsxe' 'mesa')
[ "$CARCH" == "x86_64" ] && depends=('epsxe' 'lib32-mesa')
source=(http://www.pbernert.com/gpupeopsmesagl178.tar.gz)
md5sums=('1e753dac1cc799a1dd326f5b61d2b10c')
license=('custom')
arch=('i686' 'x86_64')

prepare () {

    cd $srcdir/peops_psx_mesagl_gpu

    if [[ -f "readme.txt" ]]; then
	
	rename readme.txt README readme.txt
    fi

    if [[ -f "version.txt" ]]; then

	rename version.txt changelog version.txt
    fi

}

package () {

    cd $srcdir/peops_psx_mesagl_gpu

    install -d "$pkgdir/usr/share/doc/$pkgname"

    install -m 644 -t "$pkgdir/usr/share/doc/$pkgname" README changelog

    install -d $pkgdir/opt/epsxe/{cfg,plugins}

    install -t "$pkgdir/opt/epsxe/cfg" $(find . -name "cfg*" -print) $(find . -name "*.cfg" -print)

    install -t "$pkgdir/opt/epsxe/plugins" $(find . -name "*.so.*" -print)
    
  # permissions
  chmod 775 $pkgdir/opt/epsxe/{cfg,plugins}
  chown root:games $pkgdir/opt/epsxe/cfg/{gpuPeopsMesaGL.cfg,cfgPeopsMesaGL}
  chown root:games $pkgdir/opt/epsxe/plugins/libgpuPeopsMesaGL.so.1.0.78
  chmod 664 $pkgdir/opt/epsxe/cfg/gpuPeopsMesaGL.cfg
  chmod 755 $pkgdir/opt/epsxe/cfg/cfgPeopsMesaGL
  chmod 755 $pkgdir/opt/epsxe/plugins/libgpuPeopsMesaGL.so.1.0.78
}
