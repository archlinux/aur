# Maintainer: Alwyn Kik <alwyn@kik.pw>
# Contributor: Andreas Wagner <AndreasBWagner@pointfree.net>
# Contributor: Gerardo Exequiel Pozzi <vmlinuz386@yahoo.com.ar>

pkgname=unbuffered-git
pkgver=r1.a8f4f91
pkgrel=1
pkgdesc="Copy stdin to stdout and stderr, unbuffered, development version"
arch=('i686' 'x86_64')
url="http://www.scylla-charybdis.com/tool.php/unbuffered"
license=('GPL2')
depends=('glibc')
makedepends=('git')
changelog=ChangeLog
source=(${pkgname}-${pkgver}::'git+https://github.com/hilbix/unbuffered.git#commit=a8f4f91e0c6eed03487fb8b6998e0814b3066a96')
sha512sums=('SKIP')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  git submodule update --init
  make unbuffered_version.h
  sed -i 's/\r//' $srcdir/${pkgname}-${pkgver}/unbuffered_version.h
  make
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  mkdir -p $pkgdir/usr/bin
  make INSTALLPATH=$pkgdir/usr install
}

# vim:set ts=2 sw=2 et:
