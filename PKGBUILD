# Maintainer: Geballin - Guillaume Ballin <macniaque at free dot fr>
pkgname=xsysinfo
pkgver=1.6
pkgrel=1
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
       "Makefile.patch")

sha256sums=(55741fa09a175609436f215762032485e1f8a6bc9e5fb335ea0181619a73026b
	   a1540638cce56e2839f795d21bc0f7a0b81ed56feefe99579ea2928f495ddabb)

build() {
  cd ${srcdir}/xsysinfo-${pkgver}
  xmkmf
  patch -Np1 -i ../../Makefile.patch  
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
