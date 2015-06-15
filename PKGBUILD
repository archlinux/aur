# Maintainer: Carl George < arch at cgtx dot us >

_name="mkdocs"

pkgname="${_name}"
pkgver="0.14.0"
pkgrel="5"
pkgdesc="Project documentation with Markdown."
arch=("any")
url="http://www.mkdocs.org"
license=("BSD")
makedepends=("python-setuptools")
source=("https://pypi.python.org/packages/source/${pkgname:0:1}/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/mkdocs/mkdocs/master/LICENSE"
        "${_name}.bash_completion")
sha256sums=('5c182d3c5b148fa574d0f9be4900480a9e8ceab5d1f89e49f5a2bae0245a493a'
            'b3869f379fafec1da2acb1d830817c73cc57549090a8c09b4402301fa7318d19'
            '1ed624fb056230b57e5a833b3467f648b99153dc1058f11c13ce25313c76e197')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
}

package() {
    depends=("python-click>=4.0"
             "python-jinja>=2.7.1"
             "python-livereload>=2.3.2"
             "python-markdown>=2.5"
             "python-tornado>=4.1"
             "python-yaml>=3.10")
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
    install -Dm644 "${srcdir}/${_name}.bash_completion" "${pkgdir}/usr/share/bash-completion/completions/${_name}"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${_name}/LICENSE"
}
