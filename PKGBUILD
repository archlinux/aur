# Maintainer:  shtrophic <aur@shtrophic.net>

_pkgbase=photoprism-tensorflow
pkgbase=$_pkgbase-bin
pkgname=($_pkgbase-bin $_pkgbase-avx512-bin $_pkgbase-vnni-bin $_pkgbase-avx2-bin $_pkgbase-avx-bin $_pkgbase-ssse3-bin $_pkgbase-cuda-bin)
pkgver=2.18.0
pkgrel=1
pkgdesc="AI-Powered Photos App for the Decentralized Web (tensorflow libraries)"
arch=('x86_64')
url="https://github.com/photoprism/photoprism"
license=('Apache-2.0')
provides=($_pkgbase)

_basefile="libtensorflow-amd64"
_baseurl="https://dl.photoprism.app/tensorflow/amd64/$_basefile"

source=(
	"$_basefile-none-$pkgver.tar.gz::$_baseurl-$pkgver.tar.gz"
	"$_baseurl-avx512-$pkgver.tar.gz"
	"$_baseurl-vnni-$pkgver.tar.gz"
	"$_baseurl-avx2-$pkgver.tar.gz"
	"$_baseurl-avx-$pkgver.tar.gz"
	"$_baseurl-ssse3-$pkgver.tar.gz"
	"$_baseurl-gpu-$pkgver.tar.gz"
)

noextract=(
	"$_basefile-none-$pkgver.tar.gz"
	"$_basefile-avx512-$pkgver.tar.gz"
	"$_basefile-vnni-$pkgver.tar.gz"
	"$_basefile-avx2-$pkgver.tar.gz"
	"$_basefile-avx-$pkgver.tar.gz"
	"$_basefile-ssse3-$pkgver.tar.gz"
	"$_basefile-gpu-$pkgver.tar.gz"
)

sha256sums=('b8ed0768b249c410d44a3b22dc9275ca6a03bd849d915098d1cb126438003bf1'
            '84564f451d6404f85f343a7894082e3d5e749126e1f3493614233862114f9344'
            '2b18484d856fef4d986370758dccb6ed3585f0d9be42765d6c031d471278f4f0'
            '91eff1195e4932e2d6731f6c0de77431d87d5395030194942790d92087d7b119'
            '213014d87a1fea4bbff0021fcb8c0462c32915afac4e05de44cb65dbfa990a96'
            '12bd624bbc0833e2c9478aa2fefa29067d119c0c27b90d328fb94fcf00e48a80'
            '6ca25aae03548cf76f6f68f00bdf53ec39710f08cee23bf6419b9e6e27feca5c')

_package() {
	mkdir -p "$srcdir/$1"
	cd "$srcdir/$1"
	
	bsdtar -xf "$srcdir/$_basefile-$1-$pkgver.tar.gz"
	mkdir -p "$pkgdir/usr/include/photoprism" "$pkgdir/usr/lib/photoprism"
	mv lib/* "$pkgdir/usr/lib/photoprism"
	mv include/* "$pkgdir/usr/include/photoprism"
}

package_photoprism-tensorflow-bin() {
	_package none
}

package_photoprism-tensorflow-avx512-bin() {
	_package avx512
}

package_photoprism-tensorflow-vnni-bin() {
	_package vnni
}

package_photoprism-tensorflow-avx2-bin() {
	_package avx2
}

package_photoprism-tensorflow-avx-bin() {
	_package avx
}

package_photoprism-tensorflow-ssse3-bin() {
	_package ssse3
}

package_photoprism-tensorflow-cuda-bin() {
	_package gpu
}
