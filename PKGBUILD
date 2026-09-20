# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Maintainer: Noah Sherwin <noahrsherwin@gmail.com>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Sidney Kuyateh <autinerd-arch@kuyateh.eu>

_name=click-extra
pkgname=python-${_name}
pkgver=9.3.3
pkgrel=1
pkgdesc='Drop-in replacement for Click to make user-friendly and colorful CLI.'

url="https://github.com/kdeldycke/${_name}"
license=('GPL-2.0-or-later')
arch=('any')

makedepends=('python-pip' 'python-installer' 'python-uv-build')
# checkdepends=('git' 'python-pytest' 'python-hjson' 'python-jsonschema' 'python-pygments' 'python-pytest-httpserver' 'python-requests' 'python-tomlkit' 'python-xmltodict' 'python-yaml')
depends=('python' 'python-click>=8.4.1' 'python-boltons' 'python-pygments' 'python-json5' 'python-hjson' 'python-tomlkit' 'python-yaml' 'python-cloup' 'python-deepmerge' 'python-extra-platforms' 'python-tabulate' 'python-xmltodict' 'python-wcmatch' 'python-wcwidth' 'python-sphinx' 'python-pymdown-extensions' 'mkdocs')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kdeldycke/${_name}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('eb3fe59aa4f6fb603f69787e0c1de1f65108ac9cc2d5d6faaa69690cf2e02339b95db7782119c1b4f1676930f5df627c49a00d12b3d9e473b620a646c114f739')


build() {
    cd "${srcdir}/${_name}-${pkgver}"

    python -m build --wheel --no-isolation
}

# check() {
#     cd "${srcdir}/${_name}-${pkgver}"
#
#     python -m venv --system-site-packages venv
#
#     pytest -m "not network"
# }

package() {
    cd "${srcdir}/${_name}-${pkgver}"

    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm0644 "readme.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm0644 "license" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
