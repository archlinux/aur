# Contributor: Cilyan Olowen <gaknar@gmail.com>
pkgname=lxterminal-git
pkgver=0.3.1.r10.g3779fce
pkgrel=1
pkgdesc="VTE-based terminal emulator (part of LXDE)"
arch=('i686' 'x86_64')
url="http://lxde.org/"
license=('GPL')
depends=('gtk3' 'fontconfig' 'libx11' 'glib2' 'vte')
makedepends=('pkgconfig' 'intltool' 'git')
conflicts=('lxterminal')
provides=('lxterminal')
groups=('lxde-git')
source=(git+https://github.com/lxde/lxterminal)
sha512sums=('SKIP')

pkgver() {
  cd "lxterminal"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "lxterminal"
  
  # Generating Makefile, etc
  ./autogen.sh || return 1

  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --localstatedir=/var \
			  --enable-gtk3 \
			  --enable-man
  make
}
package() {
  cd "lxterminal"

  make DESTDIR="${pkgdir}" install 
}
