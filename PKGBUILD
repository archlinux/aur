# Maintainer: Swift Geek <swiftgeek «at» gmail> 
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: graysky <graysky AT archlinux DOT us>

pkgname=e4rat
pkgver=0.2.3
pkgrel=2
pkgdesc="Toolset to accelerate the boot process and application startups for systems with ext4 root partitions."
arch=('i686' 'x86_64')
url="http://e4rat.sourceforge.net/"
license=('GPL')
depends=('e2fsprogs' 'boost-libs')
makedepends=('audit' 'boost' 'cmake')
options=(!strip)
backup=(etc/e4rat.conf)
source=( "http://downloads.sourceforge.net/project/$pkgname/$pkgver/e4rat_${pkgver}_src.tar.gz" \
        'boost-fs3-v2.patch' )

prepare () {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 < "$srcdir/boost-fs3-v2.patch"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  unset LDFLAGS
  cmake -DCMAKE_BUILD_TYPE=Release -DBUILD_CORE_LIBRARY_STATIC=true .
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
  install -dm755 "$pkgdir/var/lib/$pkgname"
}

sha256sums=('f6feda9618eff0f9442baf771b4776b634e5a2f39e678c10e4c7946b2c6a96a0' '9a9786d6167e4a47d1733735745b0eadeabf487886405df9e6771a28f3a20965')
