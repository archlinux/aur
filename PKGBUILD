# Packager: Denis A. Altoé Falqueto <denisfalqueto@gmail.com>

pkgname=ruby-pcap
pkgver=0.6
pkgrel=2
pkgdesc="Ruby bindings for libpcap"
arch=('i686' 'x86_64')
url="http://www.goto.info.waseda.ac.jp/~fukusima/ruby/pcap-e.html"
license=('GPL')
depends=('ruby' 'libpcap')
source=(http://www.goto.info.waseda.ac.jp/~fukusima/ruby/$pkgname-$pkgver.tar.gz
	ruby-pcap-no-warnings.patch
	ruby-1.9.patch)
md5sums=('bf8024831bfbbf0cfbf7c7ca27c1b16a'
         '6ce5f0a0846731723ada2c535589c336'
         '3466b4c5d284ba3c8fa44dd679a4b60f')

build() {
  cd "$srcdir/pcap"
  patch -p0 < ../ruby-pcap-no-warnings.patch
  patch -Np1 < ../ruby-1.9.patch
  ruby extconf.rb
  make || return 1
}

package() {
  cd "$srcdir/pcap"
  make DESTDIR="$pkgdir" install
}
