# Maintainer: sant0s <diego.delossantos@mailbox.org>

pkgname=onnxruntime-bin
pkgver=1.16.3
pkgrel=1
pkgdesc="ONNX Runtime: cross-platform, high performance ML inferencing and training accelerator"
arch=('x86_64' 'aarch64')
url="https://www.onnxruntime.ai/"
license=('MIT')
provides=("onnxruntime")
conflicts=("onnxruntime")
source=("onnxruntime.zip::https://github.com/microsoft/onnxruntime/archive/refs/tags/v${pkgver}.zip")
source_x86_64=("https://github.com/microsoft/onnxruntime/releases/download/v${pkgver}/onnxruntime-linux-x64-${pkgver}.tgz")
source_aarch64=("https://github.com/microsoft/onnxruntime/releases/download/v${pkgver}/onnxruntime-linux-aarch64-${pkgver}.tgz")
sha256sums=('f85254c12cf719844640661bb3fa8d6aa0fe263d61c3bb057cb8274aa4820058')
sha256sums_x86_64=('b072f989d6315ac0e22dcb4771b083c5156d974a3496ac3504c77f4062eb248e')
sha256sums_aarch64=('784dbef93b40196aa668d29d78294a81c0d21361d36530b817bb24d87e8730e8')

package() {
    # Check the value of the $CARCH environment variable.
    if [ "$CARCH" = "x86_64" ]; then
        architecture="x64"
    elif [ "$CARCH" = "aarch64" ]; then
        architecture="aarch64"
    else
        # Handle other cases if needed
        die "Architecture '$CARCH' is not supported."
    fi

    mkdir -p "${pkgdir}/usr/include/onnxruntime"
    mkdir -p "${pkgdir}/usr/lib"
    cp -r "${srcdir}/onnxruntime-${pkgver}/include/onnxruntime"/* "${pkgdir}/usr/include/onnxruntime"
    install -Dm644 "${srcdir}/onnxruntime-linux-${architecture}-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    cp -r "${srcdir}/onnxruntime-linux-${architecture}-${pkgver}/include"/* "${pkgdir}/usr/include/onnxruntime"
    cp "${srcdir}/onnxruntime-linux-${architecture}-${pkgver}/lib"/* "${pkgdir}/usr/lib/"
}
