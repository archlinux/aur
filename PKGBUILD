pkgname=ori-git
pkgrel=1
pkgver=release_0_8_0.r108.ge019aba
pkgdesc="Peer-to-peer distributed file system with history"
arch=(i686 x86_64)
url="http://ori.scs.stanford.edu/"
license=('MIT')
depends=(libevent fuse openssl-1.0)
makedepends=(git scons2 boost)
provides=(ori)
conflicts=(ori)
source=("$pkgname"::'git+http://bitbucket.org/orifs/ori.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$pkgname"
	CPPFLAGS+=" -I/usr/include/openssl-1.0"
	LDFLAGS+=" -L/usr/lib/openssl-1.0"
	scons2
}

package() {
	cd "$srcdir/$pkgname"
	CPPFLAGS+=" -I/usr/include/openssl-1.0"
	LDFLAGS+=" -L/usr/lib/openssl-1.0"
	scons2 PREFIX="/usr" DESTDIR="$pkgdir" install
}
