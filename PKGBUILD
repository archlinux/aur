# Maintainer: Maria Nicolae <maria@marianicolae.com>

pkgname=epubsynth
pkgver=1.0.3
pkgrel=1
pkgdesc='A command-line program for generating EPUB documents'

arch=(any)
url='https://marianicolae.com/software/epubsynth/'
license=('CC-BY-4.0 OR Apache-2.0')

depends=(python)
makedepends=(python-build
             python-installer
             python-setuptools)

source=("https://marianicolae.com/files/software/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('819750e84902f1808293fc54fa5100024c3225b650e9119c8583a80887257f82')

build() {
    cd ${srcdir}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    licenses=('LICENSE' 'LICENSE.Apache-2.0' 'LICENSE.CC-BY-4.0')
    for filename in "${licenses[@]}"; do
        installpath="${pkgdir}/usr/share/licenses/${pkgname}/${filename}"
        install -Dm644 "${filename}" "${installpath}"
    done
}
