# Maintainer: Alexej Magura <agm2819*gmail*>
# Contributor: Swen Simon <swsimon at gmail dot com>

pkgname=epsxe-plugin-gpu-xgl2
pkgver=2.9
pkgrel=3
pkgdesc="Linux port of the OpenGL2 plugin"
url="http://www.pbernert.com"
[ "$CARCH" == "i686" ] && depends=('epsxe' 'mesa')
[ "$CARCH" == "x86_64" ] && depends=('epsxe' 'lib32-mesa')
source=(http://www.pbernert.com/gpupetexgl209.tar.gz http://www.pbernert.com/gpupetexgl208.tar.gz)
md5sums=('61bdad38a3a616bc000664de23d00c6e' '088c5cdc21a0807e9227d7ec4672b51d')
license=('custom')
arch=('i686' 'x86_64')

prepare () {
    
    cd $srcdir/

    
    if [[ -f "readme.txt" ]]; then

	rename "readme.txt" README "readme.txt"

    fi

    if [[ -f "version.txt" ]]; then

	rename "version.txt" changelog "version.txt"

    fi
    

}

package () {

    cd $srcdir

    install -d $pkgdir/opt/epsxe/{cfg,plugins}

    install -t "$pkgdir/opt/epsxe/cfg" $(find . -name "cfg*" -print) $(find . -name "*.cfg" -print) 

    install -t "$pkgdir/opt/epsxe/plugins" $(find . -name "*.so.*" -print)

    install -d "$pkgdir/usr/share/doc/$pkgname"

    install -m 644 -t "$pkgdir/usr/share/doc/$pkgname" README changelog 
    
  # permissions
  chown root:games $pkgdir/opt/epsxe/cfg/{cfgPeteXGL2,gpuPeteXGL2.cfg}
  chown root:games $pkgdir/opt/epsxe/plugins/libgpuPeteXGL2.so.2.0.9
  chmod 775 $pkgdir/opt/epsxe/{plugins,cfg}
  chmod 775 $pkgdir/opt/epsxe/cfg/cfgPeteXGL2
  chmod 664 $pkgdir/opt/epsxe/cfg/gpuPeteXGL2.cfg
  chmod 775 $pkgdir/opt/epsxe/plugins/libgpuPeteXGL2.so.2.0.9
}
