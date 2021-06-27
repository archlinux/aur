# Maintainer: Joaquín Rufo Gutierrez <joaquinito2051@gmail.com>
pkgname=solanum-ircd
pkgver=2.0
pkgrel=1
pkgdesc='An IRCd for unified networks'
arch=(x86_64)
url='https://solanum.chat/'
license=(GPL)
depends=('openssl' 'flex' 'bison')

source=(https://github.com/solanum-ircd/solanum/archive/refs/heads/main.tar.gz)
pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
build() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -v ../solanum-ircd-build
  cd ../solanum-ircd-build
  ../"$pkgname-$pkgver"/autogen.sh
  ../"$pkgname-$pkgver"/configure \
    --prefix=/usr

    make
    make check
}


package() {
  mkdir -p $pkgdir/usr/include
  cd "$srcdir/$pkgname-$pkgver"
  cd ../solanum-ircd-build
  make prefix="$pkgdir/usr" tooldir="$pkgdir/usr" install
}
