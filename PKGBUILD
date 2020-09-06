# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: Vesa Kaihlavirta <vegai@iki.fi>

pkgname=pwsafe
pkgver=20200906
_commit=cc9e08da251a91915470f60c38da1efec57e5854
pkgrel=1
pkgdesc="A commandline program for managing encrypted password databases"
arch=('x86_64')
url="https://github.com/nsd20463/pwsafe"
license=('GPL')
depends=('openssl' 'libxmu')
makedepends=('git')
source=("git://github.com/nsd20463/pwsafe.git#commit=${_commit}")
md5sums=('SKIP')

prepare() {
  cd "$srcdir"/${pkgname}
}

build() {
  cd "$srcdir"/${pkgname}
  aclocal
  autoheader
  automake --add-missing
  autoconf
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd "$srcdir"/${pkgname}
  make DESTDIR="$pkgdir" install
  # Make pwsafe suid root so it can seed rng as a user
  chmod +s "$pkgdir"/usr/bin/pwsafe
}
