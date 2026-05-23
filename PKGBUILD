# Maintainer:  shtrophic <aur@shtrophic.net>

_pkgbase=photoprism-onnxruntime
pkgbase="$_pkgbase-bin"
pkgname=($pkgbase $_pkgbase-cuda-bin)
pkgver=1.25.1
pkgrel=1
pkgdesc="AI-Powered Photos App for the Decentralized Web (onnx runtime)"
arch=('x86_64')
url="https://github.com/photoprism/photoprism"
license=('MIT')
provides=($_pkgbase)

source=(
	"cpu.tar.gz::https://dl.photoprism.app/onnx/runtime/v$pkgver/onnxruntime-linux-x64-$pkgver.tgz"
	"cuda.tar.gz::https://dl.photoprism.app/onnx/runtime/v$pkgver/onnxruntime-linux-x64-gpu-$pkgver.tgz"
)

noextract=(
	"cpu.tar.gz"
	"cuda.tar.gz"
)

sha256sums=('eb566a49cfc49ef0642f809b69340b5bb656c7c4905ba873526d226f2c005816'
            'ddfc4ca4ccc9cd5345d3820edab710ee84e749569d052eed92c42693d3b448a8')

_package() {
	mkdir -p "$srcdir/$1"
	cd "$srcdir/$1"

	bsdtar --strip-components 1 -xf "$srcdir/$1.tar.gz"

	mkdir -p "$pkgdir/usr/lib/photoprism"
	mv lib/lib*.so* "$pkgdir/usr/lib/photoprism"
}

package_photoprism-onnxruntime-bin() {
	_package cpu
}

package_photoprism-onnxruntime-cuda-bin() {
	_package cuda
}
