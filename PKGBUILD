# Maintainer:  shtrophic <aur@shtrophic.net>
# Contributor: Evine Deng <evinedeng@hotmail.com>
# Contributor: Thomas Eizinger <thomas@eizinger.io>

_pkgbase=photoprism-onnxruntime
pkgbase="$_pkgbase-bin"
pkgname=($pkgbase $_pkgbase-cuda-bin)
pkgver=1.24.1
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

sha256sums=('9142552248b735920f9390027e4512a2cacf8946a1ffcbe9071a5c210531026f'
            '1c468821456b7863640555e31ee5b71e56bb959874b9db0dbf79503997993673')

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
