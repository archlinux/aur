# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Jerome Leclanche <jerome@leclan.ch>

_pkgname=libfm-qt
pkgname=${_pkgname}5
pkgver=1.4.0
pkgrel=3
pkgdesc="Core library of PCManFM-Qt (Qt binding for libfm)"
arch=("x86_64")
url="https://github.com/lxqt/$_pkgname"
license=("LGPL2.1")
depends=("menu-cache" "libexif" "qt5-x11extras" "lxqt-menu-data")
makedepends=("lxqt-build-tools-qt5")
optdepends=(
  "org.freedesktop.secrets: allow to remember mount passwords"
)
provides=("libfm-qt.so")
source=(
	"https://github.com/lxqt/$_pkgname/releases/download/$pkgver/$_pkgname-$pkgver.tar.xz"
	"https://github.com/lxqt/$_pkgname/releases/download/$pkgver/$_pkgname-$pkgver.tar.xz.asc"
)
sha512sums=('d5a9bbb1f295dfbe88add760fc9c8da60771d4d49b64408b1278315b52dd071d7e24dbc9ff8354f0c68e5ad58e809e78a2dae77e2d4f52cd8e0b8409c0d7f5cb'
            'SKIP')
validpgpkeys=(
	"169704C6FB490C6892C7F23C37E0AF1FDA48F373"  # Jerome Leclanche <jerome@leclan.ch>
	"7C733BA5F585AAD669E4D23A42C9C8D3AF5EA5E3"  # Alf Gaida <agaida@siduction.org>
	"19DFDF3A579BD509DBB572D8BE793007AD22DF7E"  # Pedram Pourang <tsujan2000@gmail.com>
)
# Work-around https://gitlab.kitware.com/cmake/cmake/-/issues/17122
# Relevant CMake codes: https://github.com/lxqt/libfm-qt/blob/1.2.1/src/CMakeLists.txt#L179
options=('!emptydirs')

build() {
	cmake -B build -S "$srcdir/$_pkgname-$pkgver" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=None
	make -C build
}

package() {
	cd build
	make DESTDIR="$pkgdir" install
}
