#Maintainer: bageljr <bageljr 897 at protonmail dot com> 
pkgname=codelldb
_reponame=vscode-lldb
pkgdesc="also known as vscode-lldb (NOT lldb-vscode).  A native debugger extension for VSCode based on LLDB"
pkgver=1.7.0
pkgrel=1
url=https://github.com/vadimcn/vscode-lldb
arch=("x86_64")
license=("MIT")
options=(!debug strip) #Debug package is broken
source=("$_reponame.tar.gz::https://github.com/vadimcn/$_reponame/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("275dac810e6b20584f1b82b785fdee28539eda1b9f8b9395dd74441b43f11b3b")
depends=(lldb)
makedepends=(cmake cargo npm python)
build() {
	export CFLAGS=""
	mkdir -p build
	cmake $_reponame-$pkgver -B build -DLLDB_PACKAGE=/usr -DCMAKE_BUILD_TYPE=None -DCMAKE_INSTALL_PREFIX=/usr -Wno-dev
	cd build
	make codelldb
}
package() {
	install -D build/adapter/codelldb $pkgdir/usr/bin/codelldb	
}
