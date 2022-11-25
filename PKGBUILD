pkgname=gcc9-bin
pkgver=9.5.0_1ubuntu3
pkgrel=1
pkgdesc="The GNU Compiler Collection (series 9.x)"
arch=(x86_64 aarch64)
_arch=`uname -m|sed 's/x86_/amd/;s/arch/rm/'`
url=https://packages.ubuntu.com/kinetic/gcc-9
license=(GPL LGPL FDL custom)
depends=(libisl)
provides=(gcc9)
conflicts=(gcc9)
source=(http://ports.ubuntu.com/pool/universe/g/gcc-9/{gcc-9{,-base},cpp-9,libgcc-9-dev}_${pkgver/_/-}_$_arch.deb)
noextract=(*.deb)
md5sums=($(for I in {gcc-9{,-base},cpp-9,libgcc-9-dev};do curl -s https://packages.ubuntu.com/kinetic/$_arch/$I/download|grep MD5|cut -d'>' -f6|cut -d'<' -f1;done))
pkgver(){
	curl -s https://packages.ubuntu.com/kinetic/gcc-9|grep Package:|cut -d'(' -f2|cut -d')' -f1|sed s/-/_/
}
build(){
	for I in *.deb;do bsdtar xfO $I data.tar.zst|bsdtar xf - --exclude=usr/share/{lintian,doc/{cpp-9,gcc-9,libgcc-9-dev}};done
	mv usr/share/doc/gcc{-9-base,9-bin}
}
package(){
	cp -r usr $pkgdir
}
