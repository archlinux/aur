# Maintainer:  shtrophic <aur@shtrophic.net>

_pkgbase=photoprism-onnxruntime
pkgbase="$_pkgbase-bin"
pkgname=($pkgbase $_pkgbase-cuda-bin)
pkgver=1.26.0
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

sha256sums=('1254da24fb389cf39dc0ff3451ab48301740ffbfcbaf646849df92f80ee92c57'
            'cb7df7ee2ca0f962c7ce7c839aeae36223d146a91fb4646d62fb0046f297479f')

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
