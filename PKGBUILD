# Maintainer:  shtrophic <aur@shtrophic.net>

_pkgbase=photoprism-onnxruntime
pkgbase="$_pkgbase-bin"
pkgname=($pkgbase $_pkgbase-cuda-bin)
pkgver=1.29.0
pkgrel=1
pkgdesc="AI-Powered Photos App for the Decentralized Web (onnx runtime)"
arch=('x86_64')
url="https://github.com/photoprism/photoprism"
license=('MIT')
provides=($_pkgbase)

source=(
	"cpu.tar.gz::https://dl.photoprism.app/onnx/runtime/v$pkgver/onnxruntime-linux-x64-$pkgver.tgz"
	"cuda.tar.gz::https://dl.photoprism.app/onnx/runtime/v$pkgver/onnxruntime-linux-x64-gpu_cuda13-$pkgver.tgz"
)

noextract=(
	"cpu.tar.gz"
	"cuda.tar.gz"
)

sha256sums=('c3fddc4f139a045b0c4902c57410f0694f1c2fdf9b6939fbe38b1aeae7cd14ba'
            '844c64acfc43ab9423215c26493055ea229268e28283146cc644ecef0bdae048')

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
