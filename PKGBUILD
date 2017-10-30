# Maintainer: Georgios Kourachanis < geo dot kourachanis at gmail dot com >

_target=aarch64-linux-gnu
_relver=4.9
_relshortdate=17.01
_reldate=20${_relshortdate}
_relverdate=${_relver}-${_reldate}
_gccver=4.9.4

pkgname=${_target}-gcc49-linaro-bin
pkgver=${_relver}_${_reldate}
pkgrel=1
pkgdesc="The GNU Compiler Collection - cross compiler for ARM64 target."
arch=('i686' 'x86_64')
url="http://www.linaro.org/downloads/"
license=('GPL' 'LGPL')
provides=('aarch64-linux-gnu-gcc')
conflicts=('aarch64-linux-gnu-gcc')
options=(!emptydirs !strip staticlibs)
source_i686=("http://releases.linaro.org/components/toolchain/binaries/${_relver}-${_reldate}/${_target}/gcc-linaro-${_gccver}-${_reldate}-i686_${_target}.tar.xz")
source_x86_64=("http://releases.linaro.org/components/toolchain/binaries/${_relver}-${_reldate}/${_target}/gcc-linaro-${_gccver}-${_reldate}-x86_64_${_target}.tar.xz")
sha256sums_i686=('af32d7b71fd69f33c216a00f6c9e51c9d10b99b24194d0215f3951635dc49910')
sha256sums_x86_64=('d1f2761b697e6b49f5db1ec0cd48d2fd98224be8cb5ef182093f691e99c923eb')

package() {
	cd ${pkgdir}

	mkdir -p opt/$pkgname
	cp -a ${srcdir}/gcc-linaro-${_gccver}-${_reldate}-x86_64_${_target}/* opt/$pkgname

	rm -f 	opt/$pkgname/*-manifest.txt
	rm -f 	opt/$pkgname/bin/{gdbserver,runtest}
	rm -f 	opt/$pkgname/lib/lib*
	rm -rf 	opt/$pkgname/include
	rm -rf 	opt/$pkgname/share/{dejagnu,doc,gcc-*,gdb,info,locale}
	rm -rf 	opt/$pkgname/share/man/{man1/runtest.1,man5,man7}

	mkdir -p ${pkgdir}/usr/bin/
	cd ${pkgdir}/usr/bin/
	ln -sf	../../opt/$pkgname/bin/* ./

	cd ${pkgdir}/opt/$pkgname/$_target/bin/
	for i in *; do
		ln -sf ../../bin/$_target-$i $i
	done
}
