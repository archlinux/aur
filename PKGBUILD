# Maintainer: David Leiter <davidleiter92@gmail.com>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: FadeMind <fademind@gmail.com>
# Contributor: Zatherz <zatherz at linux dot pl>

pkgname=(qt5ct-allow-theme-override)
pkgver=0.27
pkgrel=1
pkgdesc="Qt5 configuration utility patched to allow applications to override the theme"
arch=(i686 x86_64)
provides=('qt5ct')
conflicts=('qt5ct')
url="http://qt5ct.sourceforge.net"
license=(BSD)
depends=(qt5-svg)
makedepends=(qt5-tools)
source=("http://downloads.sourceforge.net/project/qt5ct/qt5ct-$pkgver.tar.bz2"
		"allow_theme_override.patch")
sha256sums=('d3b92b9d34469cae4f66a43ca59f5f0b548ef6d37984469361329af4348ab1f3'
			'3bbb92f1a5dfdb47f93eae9e9397413670dd2e49cd36715258363f4e760ab512')


prepare() {
	cd qt5ct-$pkgver
	patch -Np1 -i "${srcdir}/allow_theme_override.patch"
}

build() {
    cd qt5ct-$pkgver
    qmake-qt5 qt5ct.pro 
    make
}

package() {
    cd qt5ct-$pkgver
    make INSTALL_ROOT="$pkgdir" install

    install -Dm644 COPYING "$pkgdir"/usr/share/licenses/qt5ct/LICENSE
} 

