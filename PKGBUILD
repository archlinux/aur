# lib32-libxqt Maintainer: elamskoy@aur
# libqxt Maintainer: (epsilom) Xavier Corredor <xavier.corredor.llano (a) gmail.com>
# libqxt Contributor: Roberto Alsina <ralsina@kde.org>
# libqxt Contributor: Tim Besard <tim.besard@gmail.com>

_pkgbase=libqxt
pkgname=lib32-$_pkgbase
pkgver=0.6.2
pkgrel=1
pkgdesc="provides a suite of cross-platform utility classes to add functionality not readily available in the Qt toolkit (32 bit)"
arch=('x86_64')
url="http://www.libqxt.org"
license=('CPL')
depends=('lib32-qt' 'lib32-openssl' 'lib32-db' ${_pkgbase})
makedepends=('lib32-qt gcc-multilib')
source=(http://bitbucket.org/libqxt/libqxt/get/v$pkgver.tar.bz2 32bit.patch)

noextract=()
build() {
	cd $startdir/src/${_pkgbase}-*
	patch -p1 -i $startdir/32bit.patch
	export CC="gcc -m32"
	export CXX="g++ -m32"
	export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
	./configure -prefix /usr -nomake designer -nomake docs -libdir /usr/lib32
	make || return 1
	make INSTALL_ROOT=$startdir/pkg install || return 1
}

package() {
  rm -r "${pkgdir}"/usr/{include,share}
}

md5sums=('a859a1757dc0aaf010df1a0783e3e001'
         '0dc5f9c80efbd875d754be0fcf765cdc')
