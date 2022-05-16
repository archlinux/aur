# Maintainer: absrdspc <repom2@airmail.cc>
# Maintainer: Andreas Wagner <AndreasBWagner@pointfree.net>
# Contributor: Gerardo Exequiel Pozzi <vmlinuz386@yahoo.com.ar>

pkgname=unbuffered
pkgver=2.0.0
pkgrel=1
pkgdesc="Copy stdin to stdout and stderr, unbuffered"
arch=('i686' 'x86_64')
url="http://www.scylla-charybdis.com/tool.php/${pkgname}"
license=('custom:CLL')
makedepends=('git')
depends=('glibc')
_commit="7302072708acbac89e1a4193266115e42bcac68c"
source=(${pkgname}-${pkgver}::"git+https://github.com/hilbix/unbuffered.git#commit=$_commit")
sha512sums=('SKIP')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  git submodule update --init
  make ${pkgname}_version.h
  sed -i 's/\r//' $srcdir/${pkgname}-${pkgver}/unbuffered_version.h
  make CFLAGS="$CFLAGS" LDFLAGS="$LDFLAGS"
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  mkdir -p $pkgdir/usr/bin
  make INSTALLPATH=$pkgdir/usr install
  install -Dm644 COPYRIGHT.CLL "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
