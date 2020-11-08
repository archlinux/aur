# Maintainer: aksr <aksr at t-com dot me>
pkgname=heirloom-doctools-git
pkgver=191015.r4.gf3a16e2.r490.f3a16e2
pkgrel=1
epoch=
pkgdesc="The Heirloom Documentation Tools provide troff, nroff, and related utilities." 
arch=('i686' 'x86_64')
url="https://github.com/n-t-roff/heirloom-doctools"
license=('CDDL')
groups=()
depends=()
makedepends=('git' 'byacc')
optdepends=()
checkdepends=()
provides=('heirloom-doctools')
conflicts=('heirloom-doctools' 'heirloom-doctools-cvs')
replaces=()
backup=()
options=()
changelog=
install=
source=("$pkgname::git+https://github.com/n-t-roff/heirloom-doctools")
noextract=()
md5sums=('SKIP')

prepare() {
  cd "$srcdir/$pkgname"
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
}

pkgver() {
  cd "$srcdir/$pkgname"
  printf "%s.r%s.%s" "$(git describe --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g')" \
                     "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  YACC=/usr/bin/byacc
  export YACC
  make
}

package() {
  cd "$srcdir/$pkgname"
  make install ROOT=$pkgdir install
  cd "LICENSE.d"
  install -Dm0644 BERKELEY.LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/BERKELEY.LICENSE
  install -m0644 CALDERA.LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/CALDERA.LICENSE
  install -m0644 COPYING.LGPL $pkgdir/usr/share/licenses/${pkgname%-*}/COPYING.LGPL
  install -m0644 LPPL-1-0.LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LPPL-1-0.LICENSE
  install -m0644 LUCENT.LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LUCENT.LICENSE
  install -m0644 OPENSOLARIS.LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/OPENSOLARIS.LICENSE
}

