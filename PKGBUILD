# Maintainer: Mariano Street <mctpyt AT protonmail DOT com>
# Based on the PKGBUILD for `openbsd-manpages`.

pkgname=netbsd-manpages
pkgver=9.3
pkgrel=1
pkgdesc='The NetBSD man pages'
arch=('any')
options=('!strip')
url='https://man.netbsd.org/'
license=('BSD')
source=("$pkgname-$pkgver.tar.xz::https://cdn.netbsd.org/pub/NetBSD/NetBSD-$pkgver/amd64/binary/sets/man.tar.xz"
        'manfmt')
sha256sums=('24ec10b7e966e78a10961808f0ec8f41b29883289bfb89c7a75ae74209e46683'
            '4b8b668c7e7b44ea06299a468169f337a346ecd77804cca24bc0bcefaf976963')

package() {
	mkdir -p $pkgdir/usr/share/man/man{1,3,3lua,4,5,7,8,9lua}

	msg2 'Reformatting for consistency with Linux man pages (this may take a while...)'
	export srcdir pkgdir pkgver
	find $srcdir/usr/share/man/man*/* -maxdepth 0 -type f |
	  xargs -P "$(nproc)" -n 1 "$srcdir/manfmt"
}
