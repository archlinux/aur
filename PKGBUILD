# Maintainer: Jomosoto <jomosoto dot proton dot me>

pkgname='ghidra-extension-bflt-loader-git'
pkgver=r9.63340fe
pkgrel=1
pkgdesc='bFLT file loader extension for Ghidra'
arch=('any')
url='https://github.com/Baldanos/ghidra-bflt-loader'
license=('MIT')
depends=('ghidra' 'java-environment>=17')
makedepends=('gradle')
source=("bFLTLoader::git+$url")
sha256sums=('SKIP')

[ -z ${GHIDRA_INSTALL_DIR+x} ] && GHIDRA_INSTALL_DIR='/opt/ghidra'


build() {
	cd bFLTLoader
	export GHIDRA_INSTALL_DIR
	gradle buildExtension
}

package() {
	install -d "$pkgdir/$GHIDRA_INSTALL_DIR/Ghidra/Extensions/"
	unzip "$(find bFLTLoader/dist/*.zip)" -d "$pkgdir/$GHIDRA_INSTALL_DIR/Ghidra/Extensions/"
}

pkgver() {
	cd bFLTLoader
	printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}
