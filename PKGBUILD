# Maintainer: osfans <waxaca (at) 163 (dot) com>
_pkgname=opencc-gui
pkgname=mingw-w64-$_pkgname-git
pkgver=r38.47b0e26
pkgrel=1
pkgdesc="Gui in Qt5 of Library for Open Chinese Convert (mingw-w64)"
arch=(any)
url="http://code.google.com/p/opencc/"
license=('Apache License 2.0')
depends=('mingw-w64-opencc' 'mingw-w64-qt5-base')
optdepends=('mingw-w64-uchardet')
source=('opencc-gui::git+https://github.com/BYVoid/opencc-gui.git')
md5sums=('SKIP')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgver() {
	cd $srcdir/$_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd $srcdir/$_pkgname
	for _arch in ${_architectures}; do
		rm -rf build
		env PATH=/usr/$_arch/lib/qt/bin:$PATH ./build.sh
		mkdir -p ${pkgdir}/usr/$_arch/share/$_pkgname
		cp build/release/$_pkgname.exe build/*.qm ${pkgdir}/usr/$_arch/share/$_pkgname
		mkdir -p ${pkgdir}/usr/$_arch/bin
		ln -s /usr/$_arch/share/$_pkgname/$_pkgname.exe ${pkgdir}/usr/$_arch/bin
	done
}
