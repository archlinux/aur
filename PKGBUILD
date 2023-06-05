# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=cwe_checker
pkgver=0.6
pkgrel=1
epoch=
pkgdesc="finds vulnerable patterns in binary executables"
arch=(x86_64)
url="https://github.com/fkie-cad/cwe_checker"
license=('LGPL3')
groups=()
depends=(gcc-libs glibc ghidra)
makedepends=(cargo)
checkdepends=()
optdepends=()
provides=($pkgname{,_install})
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::https://github.com/fkie-cad/cwe_checker/archive/refs/tags/v$pkgver.tar.gz")
noextract=()
sha256sums=('c466ef325c54f9a417029df77ee3de7e982748a119c2b8438e0db6ec5c45fdb7')
validpgpkeys=()

build() {
	pushd $pkgname-$pkgver
	make all GHIDRA_PATH=/opt/ghidra
}

package() {
	pushd $pkgname-$pkgver
	find target/release/ \( -name $pkgname -or -name ${pkgname}_install \) -executable -exec install -Dm755 {} -t $pkgdir/usr/bin/ \;
}
