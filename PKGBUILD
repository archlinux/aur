# Maintainer: devome <evinedeng@hotmail.com>
# Contributor: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Alasdair Haswell <ali at arhaswell dot co dot uk>

_pkgname=apache-libcloud
pkgname=python-apache-libcloud
pkgver=3.8.0
pkgrel=1
pkgdesc="A standard Python library that abstracts away differences among multiple cloud provider APIs. "
arch=('any')
url="https://libcloud.apache.org"
license=('Apache-2.0')
depends=('python-requests')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('75bf4c0b123bc225e24ca95fca1c35be30b19e6bb85feea781404d43c4276c91')

prepare() {
    cd "${_pkgname}-${pkgver}"
    sed -E \
        -e "s|setuptools~=[0-9]+\.[^\"]+|setuptools|" \
        -e "s|wheel~=[0-9]+\.[^\"]+|wheel|" \
        -i pyproject.toml
}

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
