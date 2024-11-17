# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=photoprism-tensorflow
pkgname="${_pkgname}-nvidia-jetson-bin"
pkgver=1.15.2
pkgrel=2
provides=("${_pkgname}" "tensorflow115")
conflicts=("${_pkgname}" "tensorflow115")
replaces=("tensorflow115")
pkgdesc="PhotoPrism Tensorflow 1.15 with NVIDIA jetson nano support"
arch=('aarch64')
url="https://github.com/tensorflow/tensorflow"
license=('Apache-2.0')
source=("https://dl.photoprism.app/tensorflow/nvidia-jetson/libtensorflow-jetson-nano-${pkgver}.tar.gz")
sha256sums=("1b51b462094e79422268248f3ac33363d38224df9cee48e9a86a5b28c475c95f")

package() {
    for so in libtensorflow.so libtensorflow_framework.so; do
        install -Dm755 "lib/${so}"  "${pkgdir}/usr/lib/${_pkgname}/${so}.${pkgver}"
        ln -s "${so}.${pkgver}"     "${pkgdir}/usr/lib/${_pkgname}/${so}.${pkgver%.*}"
        ln -s "${so}.${pkgver%.*}"  "${pkgdir}/usr/lib/${_pkgname}/${so}.${pkgver%%.*}"
        ln -s "${so}.${pkgver%%.*}" "${pkgdir}/usr/lib/${_pkgname}/${so}"
    done
}
