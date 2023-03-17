# Contributor: VirtualTam <virtualtam@flibidi.net>
# Contributor: Eugene Yudin aka Infy <Eugene dot Yudin at gmail dot com>
# Contributor: aksr <aksr at t-com dot me>
# Maintainer: slbtty <shenlebantongying@gmail.com>

pkgname=goldendict-webengine-git
pkgver=23.02.07.alpha.230226.656cd373.r34.gfb6d4f9c
pkgrel=1
pkgdesc="A feature-rich dictionary lookup program, supporting multiple dictionary formats."
arch=('i686' 'x86_64')
url="https://github.com/xiaoyifang/goldendict"
license=('GPL3')
depends=('ffmpeg' 'hunspell' 'libvorbis' 'libxtst' 'lzo' 'zlib' 'xz' 'libeb' 'opencc'
	 'qt5-svg' 'qt5-tools' 'qt5-x11extras' 'qt5-multimedia' 'qt5-webengine')
makedepends=('git')
conflicts=('goldendict' 'goldendict-git' 'goldendict-svn' 'goldendict-git-opt')
provides=('goldendict')
replaces=('goldendict-svn' 'goldendict-git-opt')
source=("$pkgname::git+https://github.com/xiaoyifang/goldendict.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/$pkgname"

	# remove the default flag U_GLIBCXX_ASSERTIONS
	echo "QMAKE_CXXFLAGS += -U_GLIBCXX_ASSERTIONS" >> goldendict.pro

}

build(){
	cd "$srcdir/$pkgname"
	qmake-qt5 "CONFIG+=release" "CONFIG+=zim_support" "CONFIG+=chinese_conversion_support" PREFIX="/usr" goldendict.pro
	make
}

package() {
	cd "$srcdir/$pkgname"
	make INSTALL_ROOT="$pkgdir" install
}
