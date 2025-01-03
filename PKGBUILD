# Maintainer: Stanislav Vasilev <contact@i-use-gentoo-btw.com>

PKG_REAL_NAME="UntitledDESessionLogout"

pkgname=ude-session-logout
pkgver=2.1.0.0
pkgrel=2
pkgdesc="A simple session logout utility"
url="https://github.com/MadLadSquad/${PKG_REAL_NAME}"
arch=(x86_64 aarch64)
license=('MIT')
depends=("gcc-libs" "glibc" "pkgconf" "untitled-imgui-framework")
provides=("lib${pkgname}Lib.so" "${pkgname}")
makedepends=("cmake" "make" "pkgconf" "untitled-imgui-framework")
source=("https://github.com/MadLadSquad/${PKG_REAL_NAME}/releases/download/v${pkgver}/${pkgname}.tar.xz")
sha256sums=('242f66251d68972343169f6ef21e631faa3b387d1f0702bdbf420537e8638e13')

build() {
	cd $srcdir || exit
	UVKBuildTool --generate "$srcdir" || exit	

	sed -i "s/install-framework: true/install-framework: false/g" "${srcdir}"/uvproj.yaml
	sed -i "s/build-mode-vendor: true/build-mode-vendor: false/g" "${srcdir}"/uvproj.yaml	
	echo "install-framework: false" >> "${srcdir}"/uvproj.yaml
	sed -i "s/lib64/lib/g" "${srcdir}"/uvproj.yaml
}

package() {
	UVKBuildTool --build "${pkgdir}"/usr /usr "${srcdir}" || exit
	rm -rf "${pkgdir}"/usr/share/utf8cpp "${pkgdir}"/usr/include/utf8cpp "${pkgdir}"/share/utf8cpp "${pkgdir}"/include/utf8cpp || exit
}
