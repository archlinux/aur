# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-pytermgui
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
#"python-${_pyname}-doc")
#pkgname=("${_pname}" "${_pname}-doc")
pkgver=7.7.4
pkgrel=1
pkgdesc="Easy building of TUIs in Python"
arch=('any')
url="https://ptg.bczsalba.com/"
license=('MIT')
makedepends=('python-hatch-fancy-pypi-readme'
             'python-build'
             'python-installer')
#            'mkdocs')
checkdepends=('python-pytest'
              'python-testfixtures'
              'python-wcwidth'
              'python-typing_extensions'
              'python-yaml')
#source=("https://github.com/oprypin/mkdocs-section-index/archive/refs/tags/v${pkgver}.tar.gz")
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
sha256sums=('f29598693ee299192f50be648933d65820e4b9a6e258007fd4bf898e3eb6c47d')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

#   msg "Building Docs"
#   mkdocs build
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    pytest || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count #
}

package_python-pytermgui() {
    depends=('python>=3.8' 'python-wcwidth' 'python-typing_extensions')
    optdepends=('python-yaml: YAML related features'
                'python-pytermgui-doc: Documentation for PyTermGUI')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
    install -D -m644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

#package_python-pytermgui-doc() {
#    pkgdesc="Documentation for PyTermGUI"
#    provides=("python-${pkgname}=${pkgver}")
#    conflicts=("python-${pkgname}")
#    cd ${srcdir}/${_pyname}-${pkgver}
#
#    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a site "${pkgdir}/usr/share/doc/${pkgbase}"
#}
