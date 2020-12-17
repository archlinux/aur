# Maintainer: Sandelinos

pkgname=sugarmaker
pkgver=2.5.0_sugar4
pkgrel=3
pkgdesc='A multi-threaded CPU miner for Sugarchain'
arch=('x86_64' 'armv7h')
url="https://github.com/decryp2kanon/sugarmaker"
licence=('GPL2')
depends=()
makedepends=()
provides=('sugarmaker')
conflicts=('sugarmaker')
source=("https://github.com/decryp2kanon/sugarmaker/archive/v${pkgver//_/-}.tar.gz")
sha256sums=('70a0b94dabcbacea1ec2c028ad382b905d070967dfa0773031bbd6784308f4fd')

build() {
  cd "$pkgname-${pkgver//_/-}"
  ./autogen.sh
  ./configure --prefix=/usr CFLAGS="-Wall -O2 -fomit-frame-pointer" CXXFLAGS="$CFLAGS -std=gnu++11"
  make
}

check() {
  cd "$pkgname-${pkgver//_/-}"
  make check
}

package() {
  install -Dm755 $srcdir/$pkgname-${pkgver//_/-}/sugarmaker $pkgdir/usr/bin/sugarmaker
}
