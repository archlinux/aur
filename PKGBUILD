# Maintainer: Justin Milam <jsmilam at gmail dot com>
# Maintainer: Syco <sycolth at gmail dot com>
pkgname=sngrep
pkgver=1.8.0
pkgrel=1
pkgdesc="A tool for displaying SIP call message flows from a terminal"
arch=('x86_64' 'i386')
url="https://github.com/irontec/sngrep"
license=('GPL')
depends=('ncurses' 'libpcap' 'pcre' 'gnutls')
makedepends=('git' 'sed')
provides=("${pkgname%}")
conflicts=("${pkgname%}")
install=
source=("${pkgname%}::git+https://github.com/irontec/sngrep.git#tag=v${pkgver%}")
md5sums=('SKIP')

build() {
	cd "$srcdir/${pkgname%}"
	./bootstrap.sh
	./configure --enable-unicode --enable-eep --with-gnutls --with-pcre --enable-ipv6 --prefix=/usr
	make
}

package() {
	cd "$srcdir/${pkgname%-VCS}"
	make DESTDIR="$pkgdir/" install
}
