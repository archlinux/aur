# Maintainer: slbtty <shenlebantongying@gmail.com>

pkgname=goldendict-ng
pkgver=23.07.23
pkgrel=1
pkgdesc="The next generation GoldenDict (Supports Qt WebEngine & Qt6)."
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/xiaoyifang/goldendict-ng"
license=('GPL3')
depends=('ffmpeg' 'hunspell' 'libvorbis' 'libxtst' 'lzo' 'libzim' 'zlib' 'xz' 'libeb' 'opencc' 'xapian-core'
	 'qt6-svg' 'qt6-tools' 'qt6-multimedia' 'qt6-webengine' 'qt6-speech' 'qt6-5compat')
makedepends=('git')
conflicts=('goldendict' 'goldendict-git' 'goldendict-ng-git' 'goldendict-svn' 'goldendict-git-opt')
provides=('goldendict')
replaces=('goldendict-svn' 'goldendict-git-opt' 'goldendict-webengine-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/xiaoyifang/goldendict-ng/archive/v${pkgver}.tar.gz")
sha256sums=('05ec3e01ce16ffee106a9d9b96d52ef434e8cd737a5e0482d40d69255fec9780')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	# remove the default flag U_GLIBCXX_ASSERTIONS
	echo "QMAKE_CXXFLAGS += -U_GLIBCXX_ASSERTIONS" >> goldendict.pro

}

build(){
	cd "$srcdir/$pkgname-$pkgver"
	qmake6 "CONFIG+=release" "CONFIG+=use_xapian" "CONFIG+=zim_support" "CONFIG+=chinese_conversion_support" PREFIX="/usr" goldendict.pro
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make INSTALL_ROOT="$pkgdir" install
}
