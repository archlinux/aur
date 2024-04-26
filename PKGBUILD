# Maintainer: Debucquoy Anthony (tonitch) <d.tonitch@gmail.com>

pkgname=openimagedebugger
_pkgname=OpenImageDebugger
pkgver=1.17.41
eigen_ver=3.4.0
pkgrel=1
pkgdesc="An advanced in-memory image visualization plugin for GDB and LLDB "
arch=('any')
url="https://github.com/OpenImageDebugger/OpenImageDebugger"
license=('MIT')
install=$pkgname.install
depends=('python>=3.8.10', 'qt5-base>=5.12.8')
makedepends=('cmake>=3.10.0')
optdepends=('gdb>=7.10: debugger',
			'lldb>=6: debugger')
source=("https://github.com/$_pkgname/$_pkgname/archive/refs/tags/v$pkgver.tar.gz"
		"https://gitlab.com/libeigen/eigen/-/archive/$eigen_ver/eigen-3.4.0.tar.gz")
sha256sums=('e3cc4b39774d3ebcedf1f80b23d84a691172945202597c662ff63cae35130945'
            '8586084f71f9bde545ee7fa6d00288b264a2b7ac3607b974e54d13e7162c1c72')

prepare() {
	mv eigen-$eigen_ver/* "$_pkgname-$pkgver/src/thirdparty/Eigen/"
}

build() {
	cd "$_pkgname-$pkgver"
	cmake -S . -B build -DCMAKE_INSTALL_PREFIX=$pkgdir/usr/share/ -DCMAKE_BUILD_TYPE=Release
	cmake --build build --config Release
}

package() {
	cd "$_pkgname-$pkgver"
	install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	cmake --build build --config Release --target install
}
