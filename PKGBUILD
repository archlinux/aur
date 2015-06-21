# Maintainer: Jan Holthuis <holthuis.jan@googlemail.com> 
pkgname=airdcnano
pkgver=1.03
pkgrel=1
pkgdesc="AirDC++ nano is a high-performance text-mode client for sharing and chatting."
arch=('any')
url="http://www.airdcpp.net/nano"
license=('GPL')
depends=('bzip2' 'ncurses' 'zlib' 'glib2' 'miniupnpc' 'geoip' 'boost' 'leveldb')
optdepends=(
  'natpmp: NAT-PMP port mapping support'
  'intel-tbb: Intel x86 multicore support'
)
makedepends=("scons")
conflicts=("airdcnano-git")
provides=("airdcnano")
source=("https://github.com/airdcnano/airdcnano/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=( '8b1176d4d5e9834888011c6aa6f114a9' )

build() {
  cd "$srcdir/airdcnano-$pkgver"
  clang_inst=0
  pacman -Qs clang>/dev/null || clang_inst=$?
  if [ "$clang_inst" -eq 0 ]
  then
    echo "Using clang, since it will compile the client twice as fast as gcc."
    export CXX=clang
  fi
  scons -Q PREFIX=/usr
}

package() {
  cd "$srcdir/airdcnano-$pkgver"
  scons -Q PREFIX=/usr --install-sandbox="$pkgdir" install
}

