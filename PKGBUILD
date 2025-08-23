# Maintainer: Stanislav Vasilev <contact@i-use-gentoo-btw.com>

PKG_REAL_NAME="UntitledDESessionLogout"

pkgname=ude-session-logout
pkgver=2.3.0.0
pkgrel=1
pkgdesc="A simple session logout utility"
url="https://github.com/MadLadSquad/${PKG_REAL_NAME}"
arch=(x86_64 aarch64)
license=('MIT')
depends=("gcc-libs" "glibc" "pkgconf" "untitled-imgui-framework")
provides=("lib${pkgname}Lib.so" "${pkgname}")
makedepends=("cmake" "make" "pkgconf" "untitled-imgui-framework")
source=("https://github.com/MadLadSquad/${PKG_REAL_NAME}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('e2cab544effa9ebaf5f1a7ba985d4265744d8c814af93bb579ffb574a45b0756')

build() {
	export nsrcdir="$srcdir/$pkgname-$pkgver"
	cd $nsrcdir || exit
	UVKBuildTool --generate "$nsrcdir" || exit	

	sed -i "s/install-framework: true/install-framework: false/g" "${nsrcdir}"/uvproj.yaml
	sed -i "s/build-mode-vendor: true/build-mode-vendor: false/g" "${nsrcdir}"/uvproj.yaml	
	echo "install-framework: false" >> "${nsrcdir}"/uvproj.yaml
	sed -i "s/lib64/lib/g" "${nsrcdir}"/uvproj.yaml
}

package() {
	UVKBuildTool --build "${pkgdir}"/usr /usr "${srcdir}/$pkgname-$pkgver" || exit
	rm -rf "${pkgdir}"/usr/share/utf8cpp "${pkgdir}"/usr/include/utf8cpp "${pkgdir}"/share/utf8cpp "${pkgdir}"/include/utf8cpp || exit
}

