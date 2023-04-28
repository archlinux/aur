# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=mkdocstrings
pkgname=("${pkgbase}")
#"${pkgbase}-doc")
pkgver=0.21.2
pkgrel=1
pkgdesc="Automatic documentation from sources, for MkDocs"
url="https://mkdocstrings.github.io"
license=('ISC')
arch=("any")
makedepends=('python-pdm-pep517'
             'python-build'
             'python-installer')
#checkdepends=('python-pytest'
#              'python-markdown-callouts'
#              'python-markdown-exec'
#              'mkdocs-material-pymdownx-extras'
#              'mkdocs-autorefs'
#              'mkdocs-coverage'
#              'mkdocs-gen-files'
#              'mkdocs-literate-nav'
#              'python-mkdocs-section-index'
#              'mkdocstrings-python')   # complete, but with circular dep
#source=("https://github.com/mkdocstrings/mkdocstrings/archive/refs/tags/${pkgver}.tar.gz")
source=("https://files.pythonhosted.org/packages/source/${pkgbase:0:1}/${pkgbase}/${pkgbase}-${pkgver}.tar.gz")
#        "${pkgver}-mkdocs.yml::https://github.com/mkdocstrings/mkdocstrings/raw/${pkgver}/mkdocs.yml"
#        "${pkgver}-CONTRIBUTING.md::https://github.com/mkdocstrings/mkdocstrings/raw/${pkgver}/CONTRIBUTING.md"
#        "${pkgver}-CHANGELOG.md::https://github.com/mkdocstrings/mkdocstrings/raw/${pkgver}/CHANGELOG.md"
#        "${pkgver}-gen_redirects.py::https://github.com/mkdocstrings/mkdocstrings/raw/${pkgver}/scripts/gen_redirects.py"
#        "${pkgver}-gen_ref_nav.py::https://github.com/mkdocstrings/mkdocstrings/raw/${pkgver}/scripts/gen_ref_nav.py")
sha256sums=('304e56a2e90595708a38a13a278e538a67ad82052dd5c8b71f77a604a4f3d911')

#prepare() {
#    cd "${pkgbase}-${pkgver}"
#
#    ln -rs {${srcdir}/${pkgver}-,}mkdocs.yml
#    ln -rs {${srcdir}/${pkgver}-,}CONTRIBUTING.md
#    ln -rs {${srcdir}/${pkgver}-,}CHANGELOG.md
#    mkdir -p scripts
#    ln -rs {${srcdir}/${pkgver}-,scripts/}gen_ref_nav.py
#    ln -rs {${srcdir}/${pkgver}-,scripts/}gen_redirects.py
#    mkdir -p docs
##   sed -i "/optional/i version = \"${pkgver}\"" pyproject.toml
#}

build() {
    cd "${pkgbase}-${pkgver}"

    python -m build --wheel --no-isolation
}

#check() {
#    cd "${pkgbase}-${pkgver}"
#
#    mkdir -p dist/lib
#    bsdtar -xpf dist/${pkgbase/-/_}-${pkgver}-py3-none-any.whl -C dist/lib
#    PYTHONPATH="dist/lib" pytest -vv --color=yes #|| warning "Tests failed" # -vv --color=yes
#}

package_mkdocstrings() {
    depends=('python>=3.7'
             'python-jinja'
             'python-markdown>=3.3'
             'python-markupsafe>=1.1'
             'python-typing_extensions>=4.1'
             'mkdocs>=1.2'
             'mkdocs-autorefs>=0.3.1'
             'pymdown-extensions>=6.3')
    cd "${pkgbase}-${pkgver}"

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

#package_mkdocstrings-doc() {
#    cd "${pkgbase}-${pkgver}"
#
#    install -D -m644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgname%-doc}"
#    cp -a site "${pkgdir}/usr/share/doc/${pkgname%-doc}"
#}
