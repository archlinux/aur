# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_upstreamver='4.0.1'
_upstreamver_regex='^[0-9]+\.[0-9]+\.[0-9]+$'
_source_type='pypi-releases'
_pypi_package='seapie'

pkgname="python-${_pypi_package}"
pkgver="${_upstreamver}"
pkgrel=1
pkgdesc="A breakpoint should just mean >>>"

arch=('any')
url='https://github.com/hirsimaki-markus/seapie'
_gurl="https://raw.githubusercontent.com/hirsimaki-markus/seapie/master"
license=('Unlicense')

depends=('python')
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')

_b2sum="87107743d4ed05486cc1eb969855c0813a8363a7dce284545717a25826df7921"
_whl="${_pypi_package}-${pkgver}-py3-none-any.whl"

options=('!strip')
noextract=("${_whl}")

source=("https://files.pythonhosted.org/packages/${_b2sum:0:2}/${_b2sum:2:2}/${_b2sum:4}/${_whl}"
        "README-${pkgver}.md::${_gurl}/readme.md"
        "LICENSE-${pkgver}::${_gurl}/unlicense.txt")
sha256sums=('b90372becb2893b6be4b6a50bec06551d09d36f3f5f479c4e213507e34494f20'
            '8a5be2e6bae87458180c428f53cde221ca32656d5b908c155ca78239a582c405'
            '82058ba64ea12a831178ec239f9bf9b4a5868ed05c28ec32c023a8eb9bf9b907')


package() {
    PIP_CONFIG_FILE=/dev/null pip install --isolated --root="${pkgdir}" --ignore-installed --no-warn-script-location --root-user-action ignore --no-deps "${_whl}"

    python -O -m compileall "${pkgdir}"

    install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
