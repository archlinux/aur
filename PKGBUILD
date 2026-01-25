# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_upstreamver='2.1.1'
_upstreamver_regex='^[0-9]+\.[0-9]+\.[0-9]+$'
_source_type='pypi-releases'
_pypi_package='importmonkey'

pkgname="python-${_pypi_package}"
pkgver="${_upstreamver}"
pkgrel=1
pkgdesc="Utility for adding new import paths."

arch=('any')
url='https://github.com/hirsimaki-markus/importmonkey'
_gurl="https://raw.githubusercontent.com/hirsimaki-markus/importmonkey/main"
license=('Unlicense')

depends=('python')
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')

_b2sum="679fd7276acf732bcb1e691c3615df532d084253fed1d4283b276cac6e5bd403"
_whl="${_pypi_package}-${pkgver}-py3-none-any.whl"

options=('!strip')
noextract=("${_whl}")

source=("https://files.pythonhosted.org/packages/${_b2sum:0:2}/${_b2sum:2:2}/${_b2sum:4}/${_whl}"
        "README-${pkgver}.md::${_gurl}/readme.md"
        "LICENSE-${pkgver}::${_gurl}/license.txt")
sha256sums=('a601cd985be7c5cbfba9d9bed5ce370c675904f240312a7934619f049de9f72a'
            '53517bd55559d4bf7b2c885e506fd827c27c1335094500f10ffaf22bdc0fd390'
            '82058ba64ea12a831178ec239f9bf9b4a5868ed05c28ec32c023a8eb9bf9b907')


package() {
    PIP_CONFIG_FILE=/dev/null pip install --isolated --root="${pkgdir}" --ignore-installed --no-warn-script-location --root-user-action ignore --no-deps "${_whl}"

    python -O -m compileall "${pkgdir}"

    install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
