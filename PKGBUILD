# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_upstreamver='1.0.0'
_upstreamver_regex='^[0-9]+\.[0-9]+\.[0-9]+$'
_source_type='pypi-releases'
_pypi_package='boolshit'

pkgname="python-${_pypi_package}"
pkgver="${_upstreamver}"
pkgrel=1
pkgdesc="Maybe is the new True. Or False."

arch=('any')
url='https://github.com/hirsimaki-markus/boolshit'
_gurl="https://raw.githubusercontent.com/hirsimaki-markus/boolshit/main"
license=('Unlicense')

depends=('python')
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')

source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${pkgver}.tar.gz"
        "README-${pkgver}.md::${_gurl}/readme.md"
        "LICENSE-${pkgver}::${_gurl}/unlicense")
sha256sums=('73206243e412c18c88bb23ffef886cb814fba93363073fbd10e92d563b5da46a'
            '15f82faec0f768ff39c929ed698b03ee7fec2c796b4101442347294c259c03a5'
            '6b0382b16279f26ff69014300541967a356a666eb0b91b422f6862f6b7dad17e')


build() {
    cd "${srcdir}/${_pypi_package//-/_}-${pkgver}/"

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package//-/_}-${pkgver}/"

    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 "../README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "../LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
