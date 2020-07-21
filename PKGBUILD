# Maintainer: Ashar Khan <ashar786khan at gmail.com>

pkgname=cpeditor
pkgver=6.5.3
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
sha256sums=('43185c017539bc0335b4c6db472690a2f208a932e5d68c8069a3c61f95fee527')

build() {
	cd "$_pkgdir"
	cmake -H. -Bbuild -DCMAKE_INSTALL_PREFIX=/usr
	cmake --build build -j$(nproc)
}

package() {
	cd "$_pkgdir/build"
	make DESTDIR="$pkgdir" install
}
