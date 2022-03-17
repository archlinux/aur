# Contributor: VirtualTam <virtualtam@flibidi.net>
# Contributor: Eugene Yudin aka Infy <Eugene dot Yudin at gmail dot com>
# Contributor: aksr <aksr at t-com dot me>
# Maintainer: slbtty <shenlebantongying@gmail.com>

pkgname=goldendict-webengine-git
pkgver=v22.2.alpha-99077318
pkgrel=1
pkgdesc="A feature-rich dictionary lookup program, supporting multiple dictionary formats."
arch=('i686' 'x86_64')
url="https://github.com/xiaoyifang/goldendict"
url="http://goldendict.org/"
license=('GPL3')
depends=('ffmpeg' 'hunspell' 'libao' 'libvorbis' 'libxtst' 'lzo' 'zlib' 'xz' 'libeb' 'libiconv' 'opencc'
	 'qt5-svg' 'qt5-tools' 'qt5-x11extras' 'qt5-multimedia' 'qt5-webengine')
makedepends=('git')
conflicts=('goldendict' 'goldendict-git' 'goldendict-svn' 'goldendict-git-opt')
provides=('goldendict')
replaces=('goldendict' 'goldendict-git' 'goldendict-svn' 'goldendict-git-opt')
source=("$pkgname::git+https://github.com/xiaoyifang/goldendict.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	git describe --always | sed 's|-|.|g'
}

prepare() {
	cd "$srcdir/$pkgname"
	msg "Fixing flags"
	echo "QMAKE_CXXFLAGS_RELEASE = $CFLAGS" >> goldendict.pro
	echo "QMAKE_CFLAGS_RELEASE = $CXXFLAGS" >> goldendict.pro
}

build(){
	cd "$srcdir/$pkgname"
	qmake-qt5 "CONFIG+=zim_support" "CONFIG+=chinese_conversion_support" PREFIX="/usr" goldendict.pro
	make
}

package() {
	cd "$srcdir/$pkgname"
	make INSTALL_ROOT="$pkgdir" install
}
