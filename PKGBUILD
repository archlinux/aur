# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgauthor="Kaia-Alenia"
pkgname="alenia-fuse"
pkgver=2.0.7
pkgrel=1
pkgdesc="High-performance universal media optimizer for images, video, and audio. Built with Nuitka and Go, with auto-GPU acceleration and crash-safe fallback"

_pypi_package=${pkgname}
_pypi_version=${pkgver}

license=('GPL-3.0')
arch=('any')

_url_pypi="https://pypi.org/project/${pkgname}/"
_url_github="https://github.com/${pkgauthor}/${pkgname}"
url="${_url_github}"

provides=("${_pypi_package#alenia-}")

makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')
depends=('python' 'python-rich' 'python-prompt_toolkit' 'python-pillow' 'python-fuse')

source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${_pypi_version}.tar.gz")
# source=("${_pypi_package}-${_pypi_version}.tar.gz::${_url_github}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f7705d74ab8c8c5e0319eea8f873f1f8ae832821bce684e7bdce653a33bd5bca')

build() {
    cd "${srcdir}/${_pypi_package//-/_}-${_pypi_version}/" || exit

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package//-/_}-${_pypi_version}/" || exit

    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
