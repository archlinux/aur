pkgname=ori-git
pkgrel=1
pkgver=r941.bcba89d
pkgdesc="Peer-to-peer distributed file system with history"
arch=(i686 x86_64)
url="http://ori.scs.stanford.edu/"
license=('MIT')
depends=(libevent fuse)
makedepends=(git scons boost)
provides=(ori)
conflicts=(ori)
source=("$pkgname"::'git+http://bitbucket.org/orifs/ori.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$pkgname"
	scons
}

package() {
	cd "$srcdir/$pkgname"
	scons PREFIX="/usr" DESTDIR="$pkgdir" install
}
