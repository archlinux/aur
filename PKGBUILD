
# Maintainer: Your Name <youremail@domain.com>
# Contributor: Asuka Minato
pkgname=cwe_checker
pkgver=0.6
pkgrel=1
pkgdesc="finds vulnerable patterns in binary executables"
arch=(x86_64)
url="https://github.com/fkie-cad/cwe_checker"
license=('LGPL3')
depends=(gcc-libs glibc ghidra)
makedepends=(cargo)
provides=($pkgname{,_install})
source=("$pkgname-$pkgver.tar.gz::https://github.com/fkie-cad/cwe_checker/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c466ef325c54f9a417029df77ee3de7e982748a119c2b8438e0db6ec5c45fdb7')

build() {
	pushd $pkgname-$pkgver
	make all GHIDRA_PATH=/opt/ghidra
}

package() {
	pushd $pkgname-$pkgver
	find target/release/ \( -name $pkgname -or -name ${pkgname}_install \) -executable -exec install -Dm755 {} -t $pkgdir/usr/bin/ \;
}
