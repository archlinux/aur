# Maintainer: Justin Milam <jsmilam at gmail dot com>
# Maintainer: Syco <sycolth at gmail dot com>
pkgname=sngrep
pkgver=1.8.3
_commit=b84f0663e47de6f238d9f81eed67612a9ab616ef
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
source=("${pkgname%}::git+https://github.com/irontec/sngrep.git#commit=${_commit}")
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
