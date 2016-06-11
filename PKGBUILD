# Maintainer: orumin <dev@orum.in>

_basename=libwacom
pkgname="lib32-$_basename"
pkgver=0.18
pkgrel=1
pkgdesc="Library to identify Wacom tablets and their features (32-bit)"
arch=('x86_64')
url="http://sourceforge.net/apps/mediawiki/linuxwacom/index.php?title=Libwacom"
license=('MIT')
depends=('glib2' 'lib32-systemd' 'lib32-libgudev' "$_basename")
source=(http://sourceforge.net/projects/linuxwacom/files/libwacom/$_basename-$pkgver.tar.bz2{,.sig})
sha256sums=('71bfa2a8d10ec2f2ada852aed816724a9af4713cbe0cf8559877b7fa56a7b722'
            'SKIP')
validpgpkeys=('9A12ECCC5383CA2AF5B42CDCA6DC66911B2127D5') #Jason Gerecke <killertofu@gmail.com>

build() {
  cd $_basename-$pkgver

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure --prefix=/usr --build=i686-pc-linux-gnu --libdir=/usr/lib32
  make
}

check() {
  cd $_basename-$pkgver
  make check
}

package() {
  cd $_basename-$pkgver
  make DESTDIR="$pkgdir" install

  cd "$pkgdir"/usr
  rm -r bin include share
  
}
