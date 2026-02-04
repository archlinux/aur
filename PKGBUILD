# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>

pkgname="mkdocs-include-markdown-plugin"
pkgver=7.2.1
pkgrel=1
pkgdesc="Mkdocs Markdown includer plugin."
url="https://github.com/mondeja/mkdocs-include-markdown-plugin"
license=('Apache-2.0')
arch=("any")
depends=("mkdocs" "python-wcmatch")
makedepends=('python-setuptools-scm' 'python-build' 'python-installer' 'python-wheel' 'python-hatchling')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('86e55d74f8b943a589436bbf0c394b91c9f2ee6522ba298f46b48199291de04d')

build(){
    cd ${srcdir}/${pkgname}-${pkgver}

    python -m build --wheel --no-isolation
}

package(){
    cd ${srcdir}/${pkgname}-${pkgver}

    install -D -m 644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m 644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

