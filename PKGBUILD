# Maintainer: Per Osbeck <per@osbeck.com>
pkgname=fuse-nfs-git
_pkgname=fuse-nfs
pkgver=r71.91c69c5
pkgrel=1
pkgdesc="This is a fuse module that implements the NFS protocol."
arch=('i686' 'x86_64' 'armv5' 'armv5h' 'armv6' 'armv6h' 'armv7' 'armv7h')
url="https://github.com/sahlberg/fuse-nfs"
license=('GPL')
makedepends=('git')
depends=('fuse2' 'libnfs')
source=("$pkgname::git+https://github.com/sahlberg/$_pkgname.git")
md5sums=(SKIP)

build() {
	cd "$srcdir/$pkgname"
	make
}
pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
prepare() { 
	cd "$srcdir/$pkgname"
	./setup.sh
	./configure --prefix=/usr
}

package() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir/" install
}
