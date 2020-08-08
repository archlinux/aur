# Maintainer: Ashar Khan <ashar786khan at gmail.com>

pkgname=cpeditor
pkgver=6.5.5
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
sha256sums=('1e3a16557e2c73ce63aaff4b0ef6ce51f7e14f1fc9a7ed2872a8e72b0a97ee51')

build() {
	cd "$_pkgdir"
	cmake -H. -Bbuild -DCMAKE_INSTALL_PREFIX=/usr
	cmake --build build -j$(nproc)
}

package() {
	cd "$_pkgdir/build"
	make DESTDIR="$pkgdir" install
}
