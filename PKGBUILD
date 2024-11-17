# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=photoprism-tensorflow
pkgname="${_pkgname}-avx-bin"
pkgver=1.15.2
pkgrel=2
provides=("${_pkgname}" "tensorflow115")
conflicts=("${_pkgname}" "tensorflow115")
replaces=("tensorflow115")
pkgdesc="PhotoPrism Tensorflow 1.15 with CPU AVX support"
arch=("x86_64")
url="https://github.com/tensorflow/tensorflow"
license=('Apache-2.0')
source=("https://dl.photoprism.app/tensorflow/amd64/libtensorflow-amd64-avx-${pkgver}.tar.gz")
sha256sums=("00f2ea3828be9b8048e2fa0bf8e7c940c41a5cf504fe1c7e412f3fe5715995e0")

package() {
    for so in libtensorflow.so libtensorflow_framework.so; do
        install -Dm755 "lib/${so}"  "${pkgdir}/usr/lib/${_pkgname}/${so}.${pkgver}"
        ln -s "${so}.${pkgver}"     "${pkgdir}/usr/lib/${_pkgname}/${so}.${pkgver%.*}"
        ln -s "${so}.${pkgver%.*}"  "${pkgdir}/usr/lib/${_pkgname}/${so}.${pkgver%%.*}"
        ln -s "${so}.${pkgver%%.*}" "${pkgdir}/usr/lib/${_pkgname}/${so}"
    done
}
