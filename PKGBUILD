# Maintainer: FFY00 (filippe.lains@gmail.com)

_target=$CARCH-unknown-linux-gnu
_gccver=6.3.0
_dver=2.068.2

pkgname=('gdc-bin' 'gdc-gcc' 'libgphobos-lib32') # libgphobos
pkgver=$_gccver+$_dver
pkgrel=1
arch=('i686' 'x86_64')
url="https://gdcproject.org/"
license=('GPL')
source_i686=("http://gdcproject.org/downloads/binaries/$_gccver/i686-linux-gnu/gdc-$pkgver.tar.xz")
source_x86_64=("http://gdcproject.org/downloads/binaries/$_gccver/x86_64-linux-gnu/gdc-$pkgver.tar.xz")
md5sums_i686=('cc8dcd66b189245e39296b1382d0dfcc')
md5sums_x86_64=('16d3067ebb3938dba46429a4d9f6178f')

package_gdc-bin() {
	depends=('gdc-gcc' 'perl' 'binutils' 'libgphobos')
	provides=("d-compiler=$_dver" "gdc=$pkgver")
	pkgdesc="Compiler for D programming language which uses gcc backend"

	install -d -m755 "$pkgdir"/usr/include/d
	cp -dr --no-preserve=ownership "$srcdir"/$_target/lib/gcc/$_target/$_gccver/include/d "$pkgdir"/usr/include
	install -D -m755 "$srcdir"/$_target/bin/gdc "$pkgdir"/usr/bin/gdc
	install -D -m755 "$srcdir"/$_target/libexec/gcc/$_target/$_gccver/cc1d "$pkgdir"/usr/bin/cc1d
	install -D -m755 "$srcdir"/$_target/bin/gdmd "$pkgdir"/usr/bin/gdmd
}

package_gdc-gcc() {
	pkgdesc="The GNU Compiler Collection - C and C++ frontends (from GDC, gdcproject.org)"
	provides=("gcc=$_gccver" "gcc-libs=$_gccver")

	install -D -m755 "$srcdir"/$_target/bin/c++ "$pkgdir"/usr/bin/gdc-c++
	install -D -m755 "$srcdir"/$_target/bin/cc "$pkgdir"/usr/bin/gdc-cc
	install -D -m755 "$srcdir"/$_target/bin/cpp "$pkgdir"/usr/bin/gdc-cpp
	install -D -m755 "$srcdir"/$_target/bin/g++ "$pkgdir"/usr/bin/gdc-g++
	install -D -m755 "$srcdir"/$_target/bin/gcc "$pkgdir"/usr/bin/gdc-gcc
	install -D -m755 "$srcdir"/$_target/bin/gcov "$pkgdir"/usr/bin/gdc-gcov
	install -D -m755 "$srcdir"/$_target/bin/gcov-tool "$pkgdir"/usr/bin/gdc-gcov-toll
	install -d -m644 "$pkgdir"/usr/include/c++/$_gccver
	cp -dr --no-preserve=ownership "$srcdir"/$_target/include/c++/$_gccver "$pkgdir"/usr/include/c++
	install -d -m644 "$pkgdir"/usr/lib/gcc/$_target/$_gccver
	cp -dr --no-preserve=ownership "$srcdir"/$_target/lib/gcc/$_target/$_gccver "$pkgdir"/usr/lib/gcc/$_target/
	install -d -m644 "$pkgdir"/usr/libexec/gcc/$_target/$_gccver
	cp -dr --no-preserve=ownership "$srcdir"/$_target/libexec/gcc/$_target/$_gccver "$pkgdir"/usr/libexec/gcc/$_target/
}

#package_libgphobos() {
#	pkgdesc="Standard library for D programming language, GDC port"
#	provides=("d-runtime" "d-stdlib")
#	
#	install -D -m644 "$srcdir"/$_target/lib64/libgphobos.so "$pkgdir"/usr/lib/libgphobos.so
#	install -D -m644 "$srcdir"/$_target/lib64/libgphobos.so "$pkgdir"/usr/lib/libgphobos.so.68
#	install -D -m644 "$srcdir"/$_target/lib64/libgphobos.so "$pkgdir"/usr/lib/libgphobos.so.68.0.2
#	install -D -m644 "$srcdir"/$_target/lib64/libgphobos.so "$pkgdir"/usr/lib/libgphobos.spec
#	install -D -m644 "$srcdir"/$_target/lib64/libgphobos.so "$pkgdir"/usr/lib/libgphobos.a
#	install -D -m644 "$srcdir"/$_target/lib64/libgphobos.so "$pkgdir"/usr/lib/libgphobos.la
#}

package_libgphobos-lib32() {
	pkgdesc="Standard library for D programming language, GDC port"
	provides=("d-runtime-lib32" "d-stdlib-lib32")
	
	install -D -m644 "$srcdir"/$_target/lib32/libgphobos.so "$pkgdir"/usr/lib32/libgphobos.so
	install -D -m644 "$srcdir"/$_target/lib32/libgphobos.so "$pkgdir"/usr/lib32/libgphobos.so.68
	install -D -m644 "$srcdir"/$_target/lib32/libgphobos.so "$pkgdir"/usr/lib32/libgphobos.so.68.0.2
	install -D -m644 "$srcdir"/$_target/lib32/libgphobos.so "$pkgdir"/usr/lib32/libgphobos.spec
	install -D -m644 "$srcdir"/$_target/lib32/libgphobos.so "$pkgdir"/usr/lib32/libgphobos.a
	install -D -m644 "$srcdir"/$_target/lib32/libgphobos.so "$pkgdir"/usr/lib32/libgphobos.la
}
