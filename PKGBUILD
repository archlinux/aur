# Maintainer: Maria Nicolae <maria@marianicolae.com>

pkgname=dochint
pkgver=1.0.0
pkgrel=1
pkgdesc='A macro processor for authoring HTML documents.'

arch=(any)
url='https://marianicolae.com/software/dochint/'
license=('Apache-2.0 OR CC-BY-4.0')

depends=(python)
makedepends=(python-build
             python-installer
             python-latex2mathml
             python-pybtex
             python-setuptools)

source=("https://marianicolae.com/files/software/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('d61275775a371695dbb926624abd36294f0fc0c6df232cc2cad52148574d016b')

build() {
    cd ${srcdir}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 CHANGELOG.md "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
    licenses=('LICENSE' 'LICENSE.Apache-2.0' 'LICENSE.CC-BY-4.0')
    for filename in "${licenses[@]}"; do
        installpath="${pkgdir}/usr/share/licenses/${pkgname}/${filename}"
        install -Dm644 "${filename}" "${installpath}"
    done
}
