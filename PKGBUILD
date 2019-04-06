# Maintainer: NexAdn <nexadn@yandex.com>
pkgname=obs-linuxbrowser
pkgver=0.6.1
pkgrel=1
pkgdesc="Browser source plugin for obs-studio based on CEF. Alternative to obs-qtwebkit."
arch=("i686" "x86_64")
url="https://github.com/bazukas/obs-linuxbrowser"
license=("GPL")
conflicts=("obs-linuxbrowser-bin")
depends=(
	"obs-studio>=21.1.2"
	"gconf" "nss" "libxss" "pango" "atk" "libxrandr" "libxcomposite"
)
makedepends=("make" "cmake" "git" "cef-minimal")
optdepends=("pepper-flash: Flash support"
	"cef-minimal: Up-to-date browser backend")
source=(
	"${pkgname}::git+https://github.com/bazukas/${pkgname}.git"
)
sha256sums=('SKIP')
prepare() {
	cd "$srcdir"/"${pkgname}"
	git checkout ${pkgver}
}
build() {
	cd "${srcdir}"/${pkgname}
	mkdir -p ./build
	cd ./build
	cmake -DCEF_ROOT_DIR="/opt/cef" -DINSTALL_SYSTEMWIDE=true -DCMAKE_INSTALL_PREFIX="/usr" ..
	make
}

package() {
	cd "${srcdir}"/${pkgname}/build
	make DESTDIR="${pkgdir}" install
}
