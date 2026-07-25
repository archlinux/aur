# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgauthor="AtlasMindAI"
pkgname="bigi"
pkgver=1.0.1
pkgrel=2
pkgdesc="BiGI shows what breaks before you change the code in any codebase."

_pypi_package=${pkgname}
_pypi_version=${pkgver}

license=('MIT')
arch=('any')

_url_github="https://github.com/${pkgauthor}/${pkgname}"
url=${_url_github}

provides=("${_pypi_package}")

makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer' 'python-hatchling')
depends=('python')

source=("${_pypi_package}-${_pypi_version}.tar.gz::${_url_github}/archive/refs/tags/v${pkgver}.tar.gz" "template.html")
sha256sums=('436b0bf320ddc8af4cfd7a0592f412f7bed9609a2f329dfbcbc3e29a295175c0'
            '2cd9161e7dd7734841517b153048a59135f7b76c98b26f7418c28464e0d4c6fd')

build() {
    cd "${srcdir}/${_pypi_package}-${_pypi_version}/" || exit

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package}-${_pypi_version}/" || exit

    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 "../template.html" "${pkgdir}/usr/lib/python3.14/site-packages/bigi/render/template.html"

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
