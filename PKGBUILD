# Maintainer: Carl George < arch at cgtx dot us >

pkgname="mkdocs"
pkgver="0.15.0"
pkgrel="1"
pkgdesc="Project documentation with Markdown."
arch=("any")
url="http://www.mkdocs.org"
license=("BSD")
makedepends=("python-setuptools")
depends=(
    "python-click>=4.0"
    "python-jinja>=2.7.1"
    "python-livereload>=2.3.2"
    "python-markdown>=2.3.1"
    "python-yaml>=3.10"
    "python-tornado>=4.1"
    "mkdocs-bootstrap>=0.1.1"
    "mkdocs-bootswatch>=0.1.0"
)
source=(
    "https://pypi.python.org/packages/source/${pkgname:0:1}/${pkgname}/${pkgname}-${pkgver}.tar.gz"
    "https://raw.githubusercontent.com/mkdocs/${pkgname}/${pkgver}/LICENSE"
    "${pkgname}.bash_completion"
)
sha256sums=(
    '44c05df29af49dc1f30f1255e112b7fc34240bc32e45c538fd43269088a838f4'
    'b3869f379fafec1da2acb1d830817c73cc57549090a8c09b4402301fa7318d19'
    '1ed624fb056230b57e5a833b3467f648b99153dc1058f11c13ce25313c76e197'
)

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
    install -Dm644 "${srcdir}/${pkgname}.bash_completion" "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
