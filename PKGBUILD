# Maintainer: Asger Hautop Drewsen <asgerdrewsen@gmail.com>

pkgname=theos-git
pkgver=2.3.r10.g7a9ec0e
pkgrel=2
pkgdesc="A cross-platform suite of tools for building and deploying software for iOS and other platforms"
arch=('any')
url="https://theos.github.io/"
license=('GPL3')
depends=('perl' 'perl-compress-raw-lzma')
makedepends=()
optdepends=(
'theos-ios-toolchain: For compiling for iOS'
'theos-ios-sdks: For compiling for iOS'
)
provides=('theos')
source=("git+https://github.com/theos/theos")
install=theos.install
sha256sums=('SKIP')

pkgver() {
	cd "theos"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "${srcdir}/theos"
	git submodule update --init --recursive

	mkdir -p "${pkgdir}/opt"
	cp -dpr --no-preserve=ownership "${srcdir}/theos" "${pkgdir}/opt"
}
