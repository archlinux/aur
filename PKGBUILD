# Maintainer:  shtrophic <aur@shtrophic.net>
# Contributor: devome <evinedeng@hotmail.com>

_pkgname=photoprism-tensorflow
pkgname="${_pkgname}-avx2-bin"
pkgver=2.18.0
pkgrel=1
provides=("${_pkgname}" "tensorflow115")
conflicts=("${_pkgname}" "tensorflow115")
replaces=("tensorflow115")
makedepends=("findutils")
pkgdesc="PhotoPrism Tensorflow with CPU AVX2 support"
arch=("x86_64")
url="https://github.com/tensorflow/tensorflow"
license=('Apache-2.0')
source=("https://dl.photoprism.app/tensorflow/amd64/libtensorflow-amd64-avx2-${pkgver}.tar.gz")
sha256sums=('91eff1195e4932e2d6731f6c0de77431d87d5395030194942790d92087d7b119')

package() {
    for so in libtensorflow.so libtensorflow_framework.so; do
        install -Dm755 "lib/${so}.${pkgver}"  "${pkgdir}/usr/lib/${_pkgname}/${so}.${pkgver}"
        ln -s "${so}.${pkgver}"     "${pkgdir}/usr/lib/${_pkgname}/${so}.${pkgver%.*}"
        ln -s "${so}.${pkgver%.*}"  "${pkgdir}/usr/lib/${_pkgname}/${so}.${pkgver%%.*}"
        ln -s "${so}.${pkgver%%.*}" "${pkgdir}/usr/lib/${_pkgname}/${so}"
    done
    for f in $(find include -type f); do
	install -Dm644 "${f}" "${pkgdir}/usr/include/${_pkgname}/${f#include}"
    done
}
