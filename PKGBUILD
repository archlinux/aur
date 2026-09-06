# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appauthor="tqdm"
_appname="envwrap"

pkgname="python-${_appname}"
pkgver=1.1.0
pkgrel=1
pkgdesc="Override parameter defaults via environment variables & config files"

license=('MPL-2.0')
arch=('any')

_url_pypi="https://pypi.org/project/${_pypi_package}/"
_url_github="https://github.com/${_appauthor}/${_appname}"
url="${_url_github}"

makedepends=('git' 'python-setuptools-scm' 'python-toml' 'python-build' 'python-installer' 'python-wheel')
depends=('python' 'python-toml' 'python-yaml' 'python-platformdirs')

source=("$pkgname::git+${_url_github}#tag=v${pkgver}")
sha256sums=('eac3342257c46025afc67d80b661642e7a8559f4f225053c6fef7d632c16b400')

build() {
    cd "${pkgname}/"

    python -m build --wheel --no-isolation
}

package() {
    cd "${pkgname}/"

    python -m installer --destdir="${pkgdir}" dist/*.whl

    # install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "LICENCE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
