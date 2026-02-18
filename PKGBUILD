# Maintainer: Maria Nicolae <maria@marianicolae.com>

pkgname=dochint
pkgver=1.0.2
pkgrel=1
pkgdesc='A macro processor for authoring HTML documents.'

arch=(any)
url='https://marianicolae.com/software/dochint/'
license=('Apache-2.0 OR CC-BY-4.0')

depends=(python
         python-latex2mathml
         python-pybtex)
makedepends=(python-build
             python-installer
             python-setuptools)

source=("https://marianicolae.com/files/software/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('91add7218f4f34894d469bd3735cf79c2be719433c7bab40b92c4f4b9e8c1522')

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
