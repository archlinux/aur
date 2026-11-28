# Maintainer: Maria Nicolae <maria@marianicolae.com>

pkgname=dochint
pkgver=1.0.4
pkgrel=1
pkgdesc='A macro processor for authoring HTML documents.'

arch=(any)
url='https://marianicolae.com/software/dochint/'
license=('Apache-2.0 OR CC-BY-4.0')

depends=(python
         python-pybtex)
makedepends=(python-build
             python-installer
             python-maturin)

source=("https://marianicolae.com/files/software/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('0077c62698d174691c1fa2f4b7a7825a7bcd128a69e7ed706c31c14b4e2032b1')

build() {
    cd ${srcdir}
    make local_wheel
}

package() {
    cd ${srcdir}
    python -m installer --destdir="${pkgdir}" dist/local/*.whl
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 CHANGELOG.md "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
    licenses=('LICENSE'
              'LICENSE.Apache-2.0'
              'LICENSE.CC-BY-4.0'
              'THIRD_PARTY_LICENSES')
    for filename in "${licenses[@]}"; do
        installpath="${pkgdir}/usr/share/licenses/${pkgname}/${filename}"
        install -Dm644 "${filename}" "${installpath}"
    done
}
