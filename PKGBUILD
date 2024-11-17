# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=photoprism-tensorflow
pkgname="${_pkgname}-cpu-bin"
pkgver=1.15.2
pkgrel=2
provides=("${_pkgname}" "tensorflow115")
conflicts=("${_pkgname}" "tensorflow115")
replaces=("tensorflow115")
pkgdesc="PhotoPrism Tensorflow 1.15 with CPU base support (no AVX/AVX2)"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/tensorflow/tensorflow"
license=('Apache-2.0')
source_x86_64=("https://dl.photoprism.app/tensorflow/amd64/libtensorflow-amd64-${pkgver}.tar.gz")
source_aarch64=("https://dl.photoprism.app/tensorflow/arm64/libtensorflow-arm64-${pkgver}.tar.gz")
source_armv7h=("https://dl.photoprism.app/tensorflow/arm/libtensorflow-arm-${pkgver}.tar.gz")
sha256sums_x86_64=("6d9002dcf271a9c8ee18ce1170db7362d920dc50f74ab3b96de0ec3e829e9f37")
sha256sums_aarch64=("aa78f8be149682b93c4888f3207d7fe3068cc4cb31314bea75864f6926942519")
sha256sums_armv7h=("a7685f592fb6491610d001154678a28cec77ca1f8710cac12f77ac02ea2ac01d")

prepare() {
    case $CARCH in
        armv7h)
            mv -f "lib/libtensorflow.so.${pkgver}" lib/libtensorflow.so
            mv -f "lib/libtensorflow_framework.so.${pkgver}" lib/libtensorflow_framework.so
            ;;
    esac
}

package() {
    for so in libtensorflow.so libtensorflow_framework.so; do
        install -Dm755 "lib/${so}"  "${pkgdir}/usr/lib/${_pkgname}/${so}.${pkgver}"
        ln -s "${so}.${pkgver}"     "${pkgdir}/usr/lib/${_pkgname}/${so}.${pkgver%.*}"
        ln -s "${so}.${pkgver%.*}"  "${pkgdir}/usr/lib/${_pkgname}/${so}.${pkgver%%.*}"
        ln -s "${so}.${pkgver%%.*}" "${pkgdir}/usr/lib/${_pkgname}/${so}"
    done
}
