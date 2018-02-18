# Maintainer: Vi0L0 <vi0l093@gmail.com>

pkgname=amdapp-aparapi
pkgver=1.0.0
_apaver=1.0.0-SNAPSHOT
pkgrel=1
pkgdesc="AMD's API for data parallel Java. Uses OpenCL"
url="https://github.com/aparapi/aparapi/"
arch=('i686' 'x86_64')
license=('Other Open Source')
groups=('amdapp')
depends=('java-environment')
makedepends=('unzip')
optdepends=('apache-ant')
provides=('aparapi')
install='aparapi.install'

source=( 'aparapi.sh')
md5sums=('994e47a2d20c1436dd4bb9586ef1b3f7')

if [ "$CARCH" = "i686" ]; then
  source+=(https://github.com/aparapi/aparapi/releases/download/${_apaver}}/dist_linux_x86.zip)
  md5sums+=('fa5902ecb99a43cce314e5c26152077f')
else
  source+=(https://github.com/aparapi/aparapi/releases/download/${_apaver}/dist_linux_x86_64.zip)
  md5sums+=('a862f9d1caefe2c3b084d8edf9f82ba6')
fi

package() {
	mkdir -p "$pkgdir"/{opt/AMDAPP/aparapi,usr/share/licenses/aparapi,etc/profile.d}
	cd ${srcdir}
	install -m755 aparapi.sh "$pkgdir/etc/profile.d/"
	cd ${srcdir}
	mv LICENSE.TXT "$pkgdir/usr/share/licenses/aparapi/"
	mv api samples aparapi.jar "$pkgdir/opt/AMDAPP/aparapi"

      if [ "${CARCH}" = "i686" ]; then
	install -m755 libaparapi_x86.so "$pkgdir/opt/AMDAPP/aparapi"
      elif [ "${CARCH}" = "x86_64" ]; then
	install -m755 libaparapi_x86_64.so "$pkgdir/opt/AMDAPP/aparapi"
# 	install -m755 libaparapi_x86_64.dylib "$pkgdir/opt/AMDAPP/aparapi"
      fi

	find $pkgdir/opt/AMDAPP/aparapi/samples -name \*.sh -exec chmod 755 {} \;
} 
