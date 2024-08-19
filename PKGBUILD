# Maintainer: Geballin - Guillaume Ballin <macniaque at free dot fr>
pkgname=xsysinfo
pkgver=1.6
pkgrel=2
pkgdesc="An X application to display some kernel parameters in graphical form. It is like a mix of top, free and xload with the values shown as horizontal bar."
url="https://sourceforge.net/projects/xsysinfo"
arch=('x86_64' 'i686')
license=('Other License')
depends=('xorg-server' 'libx11' 'libxt' 'libxaw')
optdepends=()
makedepends=(imake make gcc)
conflicts=()
replaces=()
backup=()
install=
source=("https://sourceforge.net/projects/xsysinfo/files/xsysinfo/xsysinfo-1.6/xsysinfo-1.6.tar.gz"
	"Makefile.patch"
        "sysinfo.c.patch"
        "xsysinfo.c.patch")

sha256sums=(55741fa09a175609436f215762032485e1f8a6bc9e5fb335ea0181619a73026b
	    a1540638cce56e2839f795d21bc0f7a0b81ed56feefe99579ea2928f495ddabb
	    a8cae01a85ff27fd6c93e0c4f28361dd50d2b202dbe1ca57c38618045acc305e
	    8f2e23eda66b18cfb98e93cbf3c07959767cd1863b9b9a2ddfe3de6cb028249f)

build() {
  cd ${srcdir}/xsysinfo-${pkgver}
  xmkmf
  patch -Np1 -i ../../Makefile.patch  
  patch -Np1 -i ../../sysinfo.c.patch  
  patch -Np1 -i ../../xsysinfo.c.patch  
  make clean
  make
}

package() {
  cd ${srcdir}/xsysinfo-${pkgver}
  make DESTDIR="${pkgdir}" install
  cd "${pkgdir}"
  rm usr/lib/X11/app-defaults
  mv etc/X11/app-defaults usr/lib/X11/
}
