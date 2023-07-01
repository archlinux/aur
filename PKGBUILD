# Maintainer: Kirill Fries-Raevskiy <exocarnivore@gmail.com>
_pkgbase="bpftune"
pkgname="$_pkgbase-git"
pkgver=r421.bfec666
pkgrel=1
pkgdesc="BPF/tracing tools for auto-tuning Linux"
arch=("x86_64")
url="https://github.com/oracle-samples/bpftune"
license=('GPLv2 WITH Linux-syscall-note')
#groups=()
depends=("libbpf" "libnl" "libcap")
makedepends=('git' 'bpf' 'clang' 'llvm' 'llvm-libs' 'python-docutils')
provides=("$_pkgbase")
conflicts=("$_pkgbase")
#replaces=()
#backup=()
options=('strip')
#install=
source=('git+https://github.com/oracle-samples/bpftune')
#noextract=()
md5sums=('SKIP')

CC=clang

pkgver() {
	cd "$_pkgbase"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$_pkgbase"
	make
}

package() {
	cd "$srcdir/$_pkgbase"
	make DESTDIR="$pkgdir" install
}
