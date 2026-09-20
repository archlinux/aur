# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgauthor="kanakOS01"
pkgname="ascii-forge"
pkgver=1.0.0
pkgrel=1
pkgdesc="Turn your images into ASCII art from your terminal"

_pypi_package=${pkgname}
_pypi_version=${pkgver}

license=('MIT')
arch=('any')

_url_pypi="https://pypi.org/project/${pkgname}/"
_url_github="https://github.com/${pkgauthor}/${pkgname}"
url="${_url_github}"

provides=("${_pypi_package}")
conflicts=("python-${pkgname}")

makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')
depends=('bash' 'python' 'python-textual' 'python-rich' 'python-click' 'python-colorama' 'python-pillow' 'python-importlib-metadata')

source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package}/${_pypi_package}-${_pypi_version}.tar.gz")
# source=("${_pypi_package}-${_pypi_version}.tar.gz::${_url_github}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e838ee90b7035edda1cd1d8d1f64d802497cae28272861f95fb129571747f800')


build() {
    cd "${srcdir}/${_pypi_package}-${_pypi_version}/" || exit

    python3 setup.py build
}

package() {
    cd "${srcdir}/${_pypi_package}-${_pypi_version}/" || exit

    python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
