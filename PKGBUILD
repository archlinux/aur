# Contributor: Connor Behan <connor.behan@gmail.com>

pkgname=pidgin-broadcast
pkgver=586.190c64ca83ba
pkgrel=1
pkgdesc="The Pidgin plugin allowing massive spamming"
arch=('i686' 'x86_64')
url="https://keep.imfreedom.org/pidgin/purple-plugin-pack/"
license=('GPL2')
depends=('pidgin')
makedepends=('perl-xml-parser')
#http://downloads.guifications.org/plugins/Plugin%20Pack%20Archive/purple-plugin_pack-$pkgver.tar.bz2
#https://bitbucket.org/rekkanoryo/purple-plugin-pack/get/pp_2_2_0.tar.bz2
source=('hg+https://keep.imfreedom.org/pidgin/purple-plugin-pack/')

build() {
  cd "$srcdir"/purple-plugin-pack
  hg checkout 190c64ca83ba
  sed -i -e 's/AM_CONFIG_HEADER/AC_CONFIG_HEADERS/' configure.ac

  # enables broadcast
  mv broadcast/.abusive broadcast/.build
  ./autogen.sh --prefix=/usr
  # seems to not work if we don't run configure twice
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir"/purple-plugin-pack

  install -dm755 "$pkgdir"/usr/lib/purple-2
  install -m755 broadcast/.libs/broadcast.so "$pkgdir"/usr/lib/purple-2
}

md5sums=('SKIP')
