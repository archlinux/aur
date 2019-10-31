# Maintainer Darshit Shah <aur@darnir.net>
# Contributor pepijndev

# Initial version of scripts copied from pepijndevos' scripts at:
# https://gist.github.com/pepijndevos/b35559588ba04557a74240476b2318b2

_pkgname=jitter
pkgname=$_pkgname-git
pkgver=r596.745ba29
pkgrel=1
pkgdesc="An efficient langauge virtual machine generator"
arch=('i686' 'x86_64')
url="http://ageinghacker.net/git/cgit.cgi/jitter"
license=('GPLv3+')
depends=('gc')
makedepends=('git')
provides=('jitter')
conflicts=('jitter')
source=("$_pkgname::git+http://ageinghacker.net/git/cgit.cgi/jitter#commit=745ba29c15dd56c60a7ab0320e09c1ca705018b7")
md5sums=('SKIP')

pkgver() {
	cd $_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd $_pkgname
	./bootstrap
	./configure --prefix=/usr --disable-dispatch-minimal-threading \
				--disable-dispatch-no-threading
	make
}

check() {
	cd $_pkgname
	make check
}

package() {
	cd $_pkgname
	make DESTDIR="$pkgdir/" install
}
