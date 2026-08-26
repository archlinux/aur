# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Jan Tulak <jan@tulak.me>

_name=rdrand
pkgname=librdrand
pkgver=2.1.6
_commit=2d767eaa8f1af3b134f2ec3b71d434ed16d2b692
pkgrel=1
pkgdesc="A library and an userspace application (rdrand-gen) for easy access to Intel's RdRand DRNG."
arch=("x86_64")
url="https://github.com/jtulak/RdRand"
license=('LGPL-2.1-only')
depends=('glibc' 'libgcc' 'libgomp' 'openssl')
makedepends=('git')
source=($_name::git+https://github.com/jtulak/RdRand.git#commit=$_commit)
b2sums=('40706aaf2de6be9197a8956c3eab9e4e567a19c29b9d9b94a17fc75ea84d6d24041ab498cd63a23c6e4ff800da3ab4651e11b0c51b44413437202e48aef24430')


prepare() {
	cd "$_name"
	./autogen.sh
}

build() {
	cd "$_name"
	./configure --prefix=/usr
	make
}

package() {
	cd "$_name"
	make DESTDIR="$pkgdir/" install
}
