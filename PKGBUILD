# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Asuka Minato <youremail@domain.com>
# This doesn't update, just patch to qt5, so I remove the -git
pkgname=kscope
pkgver=1.9.4
pkgrel=1
epoch=
pkgdesc="A source-code browsing, analysis and editing environment for large C projects."
arch=(x86_64)
url="https://sourceforge.net/projects/kscope/"
license=('GPL2')
groups=()
depends=(qscintilla-qt5 qt5-base glibc gcc-libs)
makedepends=()
checkdepends=()
optdepends=()
provides=(kscopeapp)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/chaoys/kscope.git")
noextract=()
sha256sums=('SKIP')
validpgpkeys=()

build() {
	cd "$pkgname"
	# https://stackoverflow.com/a/51235535
	sed -i "s/\$\${INSTALL_PATH}/\$\$\(INSTALL_PATH\)/g" ./**/*.pro
	for f in core editor cscope app; do
		pushd "$f"
		INSTALL_PATH=$pkgdir/usr/ qmake
		INSTALL_PATH=$pkgdir make -j8
		popd
	done
	INSTALL_PATH=$pkgdir/usr/ qmake
	INSTALL_PATH=$pkgdir make -j8
}

package() {
	cd "$pkgname"
	INSTALL_PATH=$pkgdir/usr/ make install
}
