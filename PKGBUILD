# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_upstreamver='1.1.12'
_upstreamver_regex='^[0-9]+\.[0-9]+\.[0-9]+$'
_source_type='pypi-releases'
_pypi_package='ssh-crypt'


pkgname="${_pypi_package}"
pkgver="${_upstreamver}"
pkgrel=1
pkgdesc="A tool to encrypt/decrypt data using your ssh key from ssh-agent"

license=('BSD-3-Clause')
arch=('any')

_url_github='https://github.com/Sets88/ssh-crypt'
_url_pypi='https://pypi.org/project/ssh-crypt/'
url="${_url_github}"

provides=("${_pypi_package}")
conflicts=("python-${pkgname}")

makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer' 'python-hatchling')
depends=('python' 'python-cryptography' 'python-paramiko')

source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${pkgver}.tar.gz")
sha256sums=('c6af598c2e6c9d0183a7c71658dc7c8e9d513be9d3d7a27b829ff4c4debacf88')

build() {
    cd "${srcdir}/${_pypi_package//-/_}-${pkgver}/" || exit

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package//-/_}-${pkgver}/" || exit

    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
