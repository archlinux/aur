# Maintainer: orumin <dev@orum.in>

_basename=check
pkgname="lib32-$_basename"
pkgver=0.10.0
pkgrel=1
pkgdesc="A unit testing framework for C (32-bit)"
arch=('x86_64')
url="http://check.sourceforge.net/"
license=('LGPL')
depends=('awk' "$_basename")
source=(http://downloads.sourceforge.net/sourceforge/$_basename/$_basename-$pkgver.tar.gz)
md5sums=('53c5e5c77d090e103a17f3ed7fd7d8b8')

build() {
  cd $_basename-$pkgver

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure --prefix=/usr --disable-static \
    --build=i686-pc-linux-gnu --libdir=/usr/lib32 
  make
}

check() {
  cd $_basename-$pkgver
  # Extremely long
  #make -k check
}

package() {
  cd $_basename-$pkgver
  make DESTDIR="$pkgdir" install

  cd "$pkgdir"/usr
  rm -r bin include share

}
