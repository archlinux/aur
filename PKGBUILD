# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=photoprism-tensorflow
pkgname="${_pkgname}-avx2-bin"
pkgver="1.15.2"
pkgrel=1
provides=("${_pkgname}" "tensorflow115")
conflicts=("${_pkgname}" "tensorflow115")
replaces=("tensorflow115")
pkgdesc="PhotoPrism Tensorflow 1.15 with cpu avx2 support"
arch=("x86_64")
url="https://github.com/tensorflow/tensorflow"
license=('Apache-2.0')
source=("https://dl.photoprism.org/tensorflow/amd64/libtensorflow-amd64-avx2-${pkgver}.tar.gz")
sha256sums=("ceee74baa813ffb0c88cbcef24d27adb8cfe6d35e31258d2e467ead1f2bb0a34")

prepare() {
    mv include/tensorflow/c/LICENSE LICENSE
}

package() {
    install -Dm644 *"LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
    find include -type f -exec install -Dm644 {} "${pkgdir}/usr/"{} \;
    for so in libtensorflow.so libtensorflow_framework.so; do
        install -Dm755 "lib/${so}"  "${pkgdir}/usr/lib/${_pkgname}/${so}.${pkgver}"
        ln -s "${so}.${pkgver}"     "${pkgdir}/usr/lib/${_pkgname}/${so}.${pkgver%.*}"
        ln -s "${so}.${pkgver%.*}"  "${pkgdir}/usr/lib/${_pkgname}/${so}.${pkgver%%.*}"
        ln -s "${so}.${pkgver%%.*}" "${pkgdir}/usr/lib/${_pkgname}/${so}"
    done
}
