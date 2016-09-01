# Maintainer: orumin <dev@orum.in>

_basename=libwacom
pkgname="lib32-$_basename"
pkgver=0.22
pkgrel=1
pkgdesc="Library to identify Wacom tablets and their features (32-bit)"
arch=('x86_64')
url="http://sourceforge.net/apps/mediawiki/linuxwacom/index.php?title=Libwacom"
license=('MIT')
depends=('glib2' 'lib32-systemd' 'lib32-libgudev' 'lib32-gtk2' "$_basename")
source=(http://sourceforge.net/projects/linuxwacom/files/libwacom/$_basename-$pkgver.tar.bz2{,.sig})
sha256sums=('97c19c216cbf4a2c54a5fc4f80d5a363bfa732500f0831a345bbc8ab385720c0'
            'SKIP')
validpgpkeys=('3C2C43D9447D5938EF4551EBE23B7E70B467F0BF') # Peter Hutterer (Who-T) <office@who-t.net> 

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
