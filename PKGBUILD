# Maintainer: Austin Haedicke <irc.freenode.net / github: gtbjj>

# If you find errors or have suggestions please contact me
# via IRC PM or submit a pull request on github.

# Contributor: Marcin Karpezo <sirmacik at gmail dot com>
# Contributor: Daenyth <Daenyth+Arch [at] gmail [dot] com>

pkgname=rakudo-star
pkgver=2015.03
pkgrel=1
pkgdesc="Rakudo Perl6 on MoarVM with additional modules"
arch=('i686' 'x86_64')
url='http://rakudo.org/'
license=(PerlArtistic)
depends=('glibc')
makedepends=('perl')
provides=('rakudo' 'rakudo-moarvm')
conflicts=('rakudo' 'rakudo-moarvm')
options=('!makeflags')
source=(http://rakudo.org/downloads/star/$pkgname-$pkgver.tar.gz)
sha512sums=('SKIP')
pkgdir="$HOME/.rakudostar"

build() {
  cd "$pkgname-$pkgver"
  perl Configure.pl --gen-moar --gen-nqp --backends=moar
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  sudo ln -sf "$srcdir"/"$pkgname-$pkgver"/install/bin/* /usr/bin/
}
