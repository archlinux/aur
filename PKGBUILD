# Maintainer: Mikaela RJ "Qyriad" Szekely <qyriad@gmail.com>
# Special thanks to Pokemod97 for libtransistor-git <3
pkgname=libtransistor-git
pkgver=1.1.0.r256.g383d582
pkgrel=2
pkgdesc="Nintendo Switch homebrew toolchain"
arch=('any')
url="https://github.com/ReSwitched/libtransistor"
license=('ISC')
groups=('base-devel')
depends=('clang'
'lld'
'squashfs-tools'
'python-elftools'
'python-lz4')
makedepends=('git'
'cmake')
provides=("libtransistor")
conflicts=("libtransistor-bin")
options=(!'strip' !'buildflags')
source=("git+https://github.com/ReSwitched/libtransistor.git#branch=development")
md5sums=("SKIP")

prepare()
{
	cd "$srcdir/libtransistor"
	git submodule update --init --recursive
}

pkgver()
{
	cd "$srcdir/libtransistor"
	git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build()
{
	cd "$srcdir/libtransistor"
	make
}

package()
{
	cd "$srcdir/libtransistor/dist"
	mkdir -p "$pkgdir/opt/libtransistor"
	cp -r * "$pkgdir/opt/libtransistor"
}
