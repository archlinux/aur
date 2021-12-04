# Maintainer: Ashar Khan <ashar786khan at gmail.com>

pkgname=cpeditor
pkgver=6.9.4
_pkgdir=cpeditor-$pkgver-full-source
pkgrel=1
pkgdesc='The editor for competitive programming'
arch=('x86_64')
url='https://github.com/cpeditor/cpeditor'
license=('GPL3')
depends=('qt5-base' 'hicolor-icon-theme')
makedepends=(
	"cmake"
	"git"
	"ninja"
	"python3"
	"qt5-tools"
)
optdepends=(
	'cf-tool: submit to Codeforces'
	'clang: C++ format and language server'
	'java-environment: compile Java'
	'java-runtime: execute Java'
	'python: execute Python'
)
conflicts=("cpeditor-git")
source=("https://github.com/cpeditor/$pkgname/releases/download/$pkgver/cpeditor-$pkgver-full-source.tar.gz")
sha256sums=('044aa39944e1cc38902fb7851181e480087b6336cf11624e6c40c03290812edc')

build() {
	cd "$_pkgdir"
	cmake -Bbuild -DCMAKE_INSTALL_PREFIX=/usr -DPORTABLE_VERSION=Off -DCMAKE_BUILD_TYPE=Release -GNinja
	cmake --build build
}

package() {
	cd "$_pkgdir/build"
	DESTDIR="$pkgdir/" ninja install
}
