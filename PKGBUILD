# Maintainer: aksr <aksr at t-com dot me>
pkgname=heirloom-doctools
pkgver=160308
pkgrel=2
epoch=
pkgdesc="The Heirloom Documentation Tools provide troff, nroff, and related utilities." 
arch=('i686' 'x86_64')
url="https://github.com/n-t-roff/heirloom-doctools"
license=('CDDL')
groups=()
depends=('')
makedepends=('')
optdepends=()
checkdepends=()
provides=('heirloom-doctools')
conflicts=('heirloom-doctools-git' 'heirloom-doctools-cvs')
replaces=()
backup=()
options=(!makeflags)
changelog=
install=
source=("https://github.com/n-t-roff/${pkgname}/archive/${pkgver}.tar.gz")
noextract=()
md5sums=('f9759a099fca6b3021da33b94b1f37a9')
sha1sums=('d5e58c868237b247f660161d5fa514834f337027')
sha256sums=('d54e22e89acfddae4cd7a1fb583ca5fce097ba4c91c7b32f634944f137af175b')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i 's@^PREFIX.*@PREFIX=/usr/heirloom/@g' mk.config
  sed -i 's@^BINDIR.*@BINDIR=/usr/heirloom/bin/ucb@g' mk.config
  sed -i 's@^LIBDIR.*@LIBDIR=/usr/heirloom/lib@g' mk.config
  sed -i 's@^PUBDIR.*@PUBDIR=/usr/heirloom/lib/doctools/pub@g' mk.config
  sed -i 's@^MANDIR.*@MANDIR=/usr/heirloom/share/man@g' mk.config
  sed -i 's@^MACDIR.*@MACDIR=/usr/heirloom/lib/doctools/tmac@g' mk.config
  sed -i 's@^FNTDIR.*@FNTDIR=/usr/heirloom/lib/doctools/font@g' mk.config
  sed -i 's@^PSTDIR.*@PSTDIR=/usr/heirloom/lib/doctools/font/devpost/postscript@g' mk.config
  sed -i 's@^TABDIR.*@TABDIR=/usr/heirloom/lib/doctools/nterm@g' mk.config
  sed -i 's@^HYPDIR.*@HYPDIR=/usr/heirloom/lib/doctools/hyphen@g' mk.config
  sed -i 's@^REFDIR.*@REFDIR=/usr/heirloom/lib/reftools@g' mk.config

  # https://github.com/n-t-roff/heirloom-doctools/commit/8f9fc8
  sed -i 's@/second part of user declarations/ {@/^#ifdef YYTYPE_UINT8$/ {@' eqn/yyval.sed
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make install ROOT=$pkgdir install
  cd "LICENSE.d"
  install -Dm0644 BERKELEY.LICENSE $pkgdir/usr/share/licenses/${pkgname}/BERKELEY.LICENSE
  install -m0644 CALDERA.LICENSE $pkgdir/usr/share/licenses/${pkgname}/CALDERA.LICENSE
  install -m0644 COPYING.LGPL $pkgdir/usr/share/licenses/${pkgname}/COPYING.LGPL
  install -m0644 LPPL-1-0.LICENSE $pkgdir/usr/share/licenses/${pkgname}/LPPL-1-0.LICENSE
  install -m0644 LUCENT.LICENSE $pkgdir/usr/share/licenses/${pkgname}/LUCENT.LICENSE
  install -m0644 OPENSOLARIS.LICENSE $pkgdir/usr/share/licenses/${pkgname}/OPENSOLARIS.LICENSE
}

