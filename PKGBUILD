# Maintainer: Maria Nicolae <maria@marianicolae.com>

pkgname=epubsynth
pkgver=1.0.5
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
sha256sums=('47a1004da7e869905d5d3c498ee0be6b532b50ac03b1f756ef7d3d3f8b29ec89')

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
