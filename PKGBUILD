# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: SpepS <dreamspepser at yahoo dot it>
# Contributor: Jonathan Conder <jonno dot conder at gmail dot com>

pkgname=lib32-gtk-engine-murrine
pkgver=0.98.2
pkgrel=2
pkgdesc="GTK2 engine to make your desktop look like the art glass works done by Venicians glass blowers (32 bit)"
arch=('x86_64')
url="http://cimitan.com/murrine/project/murrine"
license=('LGPL3')
depends=('lib32-gtk2' "${pkgname#*-}")
makedepends=('gcc-multilib' 'intltool')
source=("http://ftp.gnome.org/pub/GNOME/sources/murrine/0.98/murrine-$pkgver.tar.xz") 
sha256sums=('e9c68ae001b9130d0f9d1b311e8121a94e5c134b82553ba03971088e57d12c89')

build() {
  cd murrine-$pkgver

  export CC='gcc -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure --prefix=/usr --libdir=/usr/lib32 --enable-animation --enable-animationrtl
  make
}

package() {
  make -C murrine-$pkgver DESTDIR="$pkgdir" install

  # cleanup
  rm -rf "$pkgdir"/usr/share
}
