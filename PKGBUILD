# Contributor: VirtualTam <virtualtam@flibidi.net>
# Contributor: Eugene Yudin aka Infy <Eugene dot Yudin at gmail dot com>
# Contributor: aksr <aksr at t-com dot me>
# Maintainer: slbtty <shenlebantongying@gmail.com>

pkgname=goldendict-ng-git
pkgver=23.04.03.alpha.230425.a82ce2a8.r4.g12d9ae3d
pkgrel=1
pkgdesc="A feature-rich dictionary lookup program, supporting multiple dictionary formats."
arch=('i686' 'x86_64')
url="https://github.com/xiaoyifang/goldendict-ng"
license=('GPL3')
depends=('ffmpeg' 'hunspell' 'libvorbis' 'libxtst' 'lzo' 'zlib' 'xz' 'libeb' 'opencc'
	 'qt6-svg' 'qt6-tools' 'qt6-multimedia' 'qt6-webengine' 'qt6-speech' 'qt6-5compat')
makedepends=('git')
conflicts=('goldendict' 'goldendict-git' 'goldendict-svn' 'goldendict-git-opt')
provides=('goldendict')
replaces=('goldendict-svn' 'goldendict-git-opt' 'goldendict-webengine-git')
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
	qmake6 "CONFIG+=release" "CONFIG+=zim_support" "CONFIG+=chinese_conversion_support" PREFIX="/usr" goldendict.pro
	make
}

package() {
	cd "$srcdir/$pkgname"
	make INSTALL_ROOT="$pkgdir" install
}
