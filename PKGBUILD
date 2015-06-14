# Maintainer: Steffen Weber <-boenki-gmx-de->
# Contributor: juan pablo gonzalez <lord_jotape@yahoo.com.ar>
 
pkgname=herrie
pkgver=2.2
pkgrel=4
pkgdesc="Minimalistic music player for the command line"
url="http://herrie.info"
arch=('i686' 'x86_64')
license=('custom')
depends=('libmodplug' 'libsndfile' 'libid3tag' 'libxspf' 'libmad' 'curl' 'glib2')
provides=('herrie-git')
conflicts=('herrie-git')
source=($url/distfiles/$pkgname-$pkgver.tar.bz2)
md5sums=('88832b10298ab89473730eb0c93b6ddf')

prepare() {
  cd $pkgname-$pkgver
  sed -i \
   -e s/spiff/xspf/g \
   -e s/SPIFF/XSPF/g \
   -e s/Spiff/Xspf/g \
   {configure,src/*.c}

   sed -i s!modplug.h!libmodplug/modplug.h! src/audio_format_modplug.c
}

build() {
  cd $pkgname-$pkgver
  ./configure
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR=$pkgdir install
  install -Dm644 COPYING $pkgdir/usr/share/licenses/$pkgname/LICENSE
}