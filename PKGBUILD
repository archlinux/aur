# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=mkdocstrings
pkgname=("${pkgbase}")
#"${pkgbase}-doc")
pkgver=0.23.0
pkgrel=1
pkgdesc="Automatic documentation from sources, for MkDocs"
url="https://mkdocstrings.github.io"
license=('ISC')
arch=("any")
makedepends=('python-pdm-backend'
             'python-build'
             'python-installer')
#checkdepends=('python-pytest'
#              'python-pathspec'
#              'python-sphinx'
#              'python-markdown-callouts'
#              'python-markdown-exec'
#              'mkdocs-material-pymdownx-extras'
#              'mkdocs-autorefs'
#              'mkdocs-coverage'
#              'mkdocs-gen-files'
#              'mkdocs-git-committers-plugin-2'
#              'mkdocs-literate-nav'
#              'mkdocs-redirects'
##              'python-mkdocs-section-index'
#              'mkdocstrings-python')   # complete, but with circular dep
#source=("https://github.com/mkdocstrings/mkdocstrings/archive/refs/tags/${pkgver}.tar.gz")
source=("https://files.pythonhosted.org/packages/source/${pkgbase:0:1}/${pkgbase}/${pkgbase}-${pkgver}.tar.gz")
#        "${pkgver}-mkdocs.yml::https://github.com/mkdocstrings/mkdocstrings/raw/${pkgver}/mkdocs.yml"
#        "${pkgver}-CONTRIBUTING.md::https://github.com/mkdocstrings/mkdocstrings/raw/${pkgver}/CONTRIBUTING.md"
#        "${pkgver}-CHANGELOG.md::https://github.com/mkdocstrings/mkdocstrings/raw/${pkgver}/CHANGELOG.md"
##        "${pkgver}-main.html::https://github.com/mkdocstrings/mkdocstrings/raw/${pkgver}/docs/.overrides/main.html"
##        "${pkgver}-gen_redirects.py::https://github.com/mkdocstrings/mkdocstrings/raw/${pkgver}/scripts/gen_redirects.py"
#        "${pkgver}-gen_ref_nav.py::https://github.com/mkdocstrings/mkdocstrings/raw/${pkgver}/scripts/gen_ref_nav.py")
sha256sums=('d9c6a37ffbe7c14a7a54ef1258c70b8d394e6a33a1c80832bce40b9567138d1c')

#prepare() {
#    cd "${pkgbase}-${pkgver}"
#
#    ln -rs {${srcdir}/${pkgver}-,}mkdocs.yml
#    ln -rs {${srcdir}/${pkgver}-,}CONTRIBUTING.md
#    ln -rs {${srcdir}/${pkgver}-,}CHANGELOG.md
#    mkdir -p scripts
#    ln -rs {${srcdir}/${pkgver}-,scripts/}gen_ref_nav.py
##    ln -rs {${srcdir}/${pkgver}-,scripts/}gen_redirects.py
#    mkdir -p docs/.overrides
##    ln -rs {${srcdir}/${pkgver}-,docs/.overrides/}main.html
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
#    PYTHONPATH="dist/lib" pytest -vv -l -ra --color=yes -o console_output_style=count #|| warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count
#}

package_mkdocstrings() {
    depends=('python>=3.8'
             'python-jinja>=2.11.1'
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
