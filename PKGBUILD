# Maintainer:  shtrophic <aur@shtrophic.net>

_pkgbase=photoprism-onnxruntime
pkgbase="$_pkgbase-bin"
pkgname=($pkgbase $_pkgbase-cuda-bin)
pkgver=1.27.0
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

sha256sums=('547e40a48f1fe73e3f812d7c88a948612c23f896b91e4e2ee1e232d7b468246f'
            '1a3227e1dc2f53d9f877c93278af500b15e26d99aa5ade877692138b3ab7d351')

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
