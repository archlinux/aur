# Maintainer: Niklas Krafczyk <krafczyk.n at gmail dot com>
# Contributor: nickolai
pkgname=klee-uclibc
pkgver=1.3
pkgrel=4
epoch=
pkgdesc="uclibc for a symbolic virtual machine built on top of the LLVM compiler infrastructure"
arch=('x86_64')
url="https://klee.github.io/"
license=('LGPL2.1')
groups=()
depends=()
makedepends=('llvm14'
             'clang14'
             'git'
             'python'
             'wget')
checkdepends=()
optdepends=()
provides=('klee-uclibc')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/klee/klee-uclibc.git#tag=klee_uclibc_v1.3")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

prepare() {
    cd "$srcdir/klee-uclibc"
    DEVEL_PREFIX="/usr/share/klee-uclibc/" ./configure --make-llvm-lib --with-llvm-config=/usr/bin/llvm-config-14 --with-cc=/usr/lib/llvm14/bin/clang
    sed -i 's|DEVEL_PREFIX="[^"]*"|DEVEL_PREFIX="/usr/share/klee-uclibc/usr"|' .config
    sed -i 's|RUNTIME_PREFIX="[^"]*"|RUNTIME_PREFIX="/usr/share/klee-uclibc/usr"|' .config
}

build() {
    cd "$srcdir/klee-uclibc"
	make -j1
}

package() {
	cd "$srcdir/klee-uclibc"
	make DESTDIR="$pkgdir/" install
}
