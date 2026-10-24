pkgname=lazyverilog
pkgver=2.1.2
pkgrel=1
epoch=
pkgdesc="A fast, practical SystemVerilog LSP for RTL coding."
arch=("any")
url="https://github.com/lazyverilog/LazyVerilog"
license=("MIT")
groups=()
makedepends=("cmake" "git")
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/lazyverilog/LazyVerilog/archive/v${pkgver}.tar.gz")
noextract=()

validpgpkeys=()

build() {
	cd "LazyVerilog-${pkgver}"
	cmake -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
	cmake --build build -j"$(nproc)" --target lazyverilog-lsp lazyverilog-lint lazyverilog-rtltree
}

package() {
	cd "LazyVerilog-${pkgver}/build"
	install -Dm755 lazyverilog-lsp "$pkgdir/usr/bin/lazyverilog-lsp"
	install -Dm755 lazyverilog-lint "$pkgdir/usr/bin/lazyverilog-lint"
	install -Dm755 lazyverilog-rtltree "$pkgdir/usr/bin/lazyverilog-rtltree"
	install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha256sums=('0ab6ab47e00609a7f56fdad67aa536245ac1ea7a86a6d19a35d5d25826c12d58')
