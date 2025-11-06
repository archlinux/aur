# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=mkdocstrings-crystal
_pyname=("${pkgbase//-/_}")
#pkgname=("${pkgbase}" "${pkgbase}-doc")
#_pkgsuff=${pkgbase#mkdocstrings-}
pkgname=("${pkgbase}")
pkgver=0.3.8
pkgrel=1
pkgdesc="Crystal language doc generator for mkdocstrings"
arch=('any')
url="https://mkdocstrings.github.io/crystal"
license=('MIT')
makedepends=('python-hatchling'
#            'python-platformdirs'
             'python-build'
             'python-installer')
#            'mkdocstrings-python'
#            'mkdocs-material-pymdownx-extras'
#            'mkdocs-section-index'
#            'python-markdown-callouts'
checkdepends=('python-pytest-golden'
              'mkdocstrings'
              'python-markdown-callouts')   # markupsafe required by jinja, mkdocstrings
#              'python-cached-property'
              # mkdocstrings, markdown-callouts
#source=("https://github.com/mkdocstrings/crystal/archive/refs/tags/v${pkgver}.tar.gz")
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('5757e27474f863ef6a9cf69bb7d06e67')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
#   cd "${_pkgsuff}-${pkgver}"
    python -m build --wheel --no-isolation

#   msg "Building Docs"
#   mkdocs build
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}
#   cd "${_pkgsuff}-${pkgver}"

#   mkdir -p dist/lib
#   bsdtar -xpf dist/${pkgbase/-/_}-${pkgver}-py3-none-any.whl -C dist/lib
#   PYTHONPATH="dist/lib" pytest -vv -l -ra --color=yes -o console_output_style=count # || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count #
    PYTHONPATH="." pytest || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count #
}

package_mkdocstrings-crystal() {
    depends=('python>=3.9'
             'python-jinja>=2.11.2'
             'python-markdown-callouts>=0.1.0'
             'python-markupsafe>=1.1.1'
             'mkdocs-autorefs>=0.3.1'
             'mkdocstrings>=0.30.0')
    cd ${srcdir}/${_pyname}-${pkgver}
#   cd "${_pkgsuff}-${pkgver}"

    install -D -m644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

#package_mkdocstrings-crystal-doc() {
#    pkgdesc="Documentation for mkdocstrings-crystal"
##   cd ${srcdir}/${_pyname}-${pkgver}
#    cd "${pkgsuff}-${pkgver}"
#
#    install -D -m644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a site "${pkgdir}/usr/share/doc/${pkgbase}"
#}
