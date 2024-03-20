# Maintainer: Christian Schendel < doppelhelix@gmail.com >

pkgname=fortune-mod-de
pkgver=0.36
pkgrel=1
pkgdesc="Fortune Cookies in german, from the Debian project"
url="https://packages.debian.org/source/sid/fortunes-de"
depends=(
	'fortune-mod'
)
makedepends=(
	'recode'
)
source=(http://ftp.de.debian.org/debian/pool/main/f/fortunes-de/fortunes-de_$pkgver.orig.tar.gz)
arch=('any')
license=('GPL2')
md5sums=('0a59881abb5af5d44be06c70ed91308f')
provides=("${pkgname}")
conflicts=("${pkgname}")

build() {
	cd "$srcdir/fortunes-de-${pkgver}"
	PREFIX=$(pwd)/build \
	DOCDIR=usr/share/doc/${pkgname%-git} \
	BINDIR=usr/bin \
	FORTUNESDIR=usr/share/fortune \
		./install.sh -utf8
}

package() {
	cd "$srcdir/fortunes-de-${pkgver}/build"
	rm -r {man,usr/bin}
	cp -r * "${pkgdir}"
	# Remove *.u8 files and strip ".fortunes" from filenames
	cd $pkgdir/usr/share/fortune/de
	mv debian debian-de
	mv debian.dat debian-de.dat
	rm *.u8
	mv * ..
	cd ..
	rm -r de
}
