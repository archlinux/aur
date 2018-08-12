# Maintainer: Thomas Hipp <thomashipp at gmail dot com>
pkgname=dqlite-git
_pkgname=dqlite
pkgver=r308.dbb2203
pkgrel=1
pkgdesc="Distributed SQLite"
arch=('x86_64')
url="https://github.com/CanonicalLtd/dqlite"
license=('Apache')
depends=('libuv>=1.8.0' 'sqlite-replication>=3.22.0')
makedepends=('git')
source=("git+https://github.com/CanonicalLtd/dqlite.git")
sha256sums=('SKIP')
conflicts=('dqlite')
provides=('dqlite')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$_pkgname"
}

build() {
	cd "$_pkgname"
	autoreconf -i
	./configure --prefix=/usr
	make
}

package() {
	cd "$_pkgname"
	make DESTDIR="$pkgdir/" install
}
