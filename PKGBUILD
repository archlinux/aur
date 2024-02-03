# Maintainer: aksr <aksr at t-com dot me>
pkgname=heirloom-doctools
pkgver=191015
pkgrel=2
pkgdesc='The Heirloom Documentation Tools provide troff, nroff, and related utilities.'
arch=('i686' 'x86_64')
url="https://github.com/n-t-roff/heirloom-doctools"
license=('CDDL')
makedepends=('byacc')
optdepends=()
checkdepends=()
provides=("${pkgname}")
conflicts=("${pkgname}-git" "${pkgname}-cvs")
options=(!makeflags)
source=("https://github.com/n-t-roff/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('4d400f8fb74a655c28848e3f17d3ee31')
sha1sums=('b6994f0174ffa65aba9dc1cbe1f2724019ab92cf')
sha256sums=('e0d2cfbc2a9dde25705d942966ca73d004b8628d4af2bdc5029e0b91686323f2')
sha512sums=('60fd531c29edc7ecee479b69111effa30555c6ba93de3aa4c9f3f06d50a504848eaf800f8fd39865f83d6ed73c03b14e1a416bf942ba82f8a4211344002ad179')

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
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	export YACC=/usr/bin/byacc
	export CPPFLAGS="$CPPFLAGS -fcommon"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make install ROOT=$pkgdir install
	cd "LICENSE.d"
	install -D -m0644 BERKELEY.LICENSE $pkgdir/usr/share/licenses/${pkgname}/BERKELEY.LICENSE
	install -m0644 CALDERA.LICENSE $pkgdir/usr/share/licenses/${pkgname}/CALDERA.LICENSE
	install -m0644 COPYING.LGPL $pkgdir/usr/share/licenses/${pkgname}/COPYING.LGPL
	install -m0644 LPPL-1-0.LICENSE $pkgdir/usr/share/licenses/${pkgname}/LPPL-1-0.LICENSE
	install -m0644 LUCENT.LICENSE $pkgdir/usr/share/licenses/${pkgname}/LUCENT.LICENSE
	install -m0644 OPENSOLARIS.LICENSE $pkgdir/usr/share/licenses/${pkgname}/OPENSOLARIS.LICENSE
}
