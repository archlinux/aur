# Maintainer: Ashar Khan <ashar786khan at gmail.com>

pkgname=cpeditor
pkgver=6.5.4
_pkgdir=cpeditor-$pkgver-full-source
pkgrel=1
pkgdesc='The editor for competitive programming'
arch=('x86_64')
url='https://github.com/cpeditor/cpeditor'
license=('GPL3')
depends=('qt5-base')
makedepends=("cmake" "git" "python3")
optdepends=(
	'cf-tool: submit to Codeforces support'
	'clang: C++ format and language server support'
	'jdk-openjdk: compile Java support'
	'jre-openjdk: execute Java support'
	'python: execute Python support'
	'xterm: detached run support'
)
conflicts=("cpeditor-git")
source=("https://github.com/cpeditor/$pkgname/releases/download/$pkgver/cpeditor-$pkgver-full-source.tar.gz")
sha256sums=('557acea3728dd733e6cb8829afded7b03dba9cf6b20d55f61c3f4f150c43c950')

build() {
	cd "$_pkgdir"
	cmake -H. -Bbuild -DCMAKE_INSTALL_PREFIX=/usr
	cmake --build build -j$(nproc)
}

package() {
	cd "$_pkgdir/build"
	make DESTDIR="$pkgdir" install
}
