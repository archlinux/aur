# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=mkdocs-coverage
pkgname=("${pkgbase}")
#"${pkgbase}-doc")
_pyname=("${pkgbase//-/_}")
#_pyname=("${pkgbase}")
pkgver=1.0.0
pkgrel=1
pkgdesc="MkDocs plugin to integrate your coverage HTML report into your site"
url="https://pawamoy.github.io/mkdocs-coverage"
license=('ISC')
arch=("any")
makedepends=('python-pdm-backend'
             'python-build'
             'python-installer')
#checkdepends=('python-pytest'
#              'python-pathspec'
#              'python-markdown-callouts'
#              'python-markdown-exec'
##              'python-toml'
#              'mkdocs-gen-files'
#              'mkdocs-literate-nav'
#              'mkdocs-material'
#              'mkdocs-material-extensions'
##              'python-mkdocs-section-index'
#              'mkdocs-git-committers-plugin-2'
#              'mkdocstrings-python')   #  FileNotFoundError: [Errno 2] No such file or directory: 'pdm.lock'
#source=("https://github.com/pawamoy/mkdocs-coverage/archive/refs/tags/${pkgver}.tar.gz")
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
#        "${pkgver}-mkdocs.yml::https://github.com/pawamoy/mkdocs-coverage/raw/${pkgver}/mkdocs.yml"
#        "${pkgver}-main.html::https://github.com/pawamoy/mkdocs-coverage/raw/${pkgver}/mkdocs.yml"
#        "${pkgver}-CONTRIBUTING.md::https://github.com/pawamoy/mkdocs-coverage/raw/${pkgver}/CONTRIBUTING.md"
#        "${pkgver}-CHANGELOG.md::https://github.com/pawamoy/mkdocs-coverage/raw/${pkgver}/CHANGELOG.md"
#        "${pkgver}-gen_ref_nav.py::https://github.com/pawamoy/mkdocs-coverage/raw/${pkgver}/scripts/gen_ref_nav.py"
#        )
sha256sums=('3ebe0837c29458f64843c45cbb6618859634326867056d030621ab164649904c')

#prepare() {
#    cd "${_pyname}-${pkgver}"
#    cd "${pkgname}-${pkgver}"
#
##   ln -rs {${srcdir}/${pkgver}-,}mkdocs.yml
##   mkdir -p docs/.overrides
##   ln -rs {${srcdir}/${pkgver}-,}CONTRIBUTING.md
##   ln -rs {${srcdir}/${pkgver}-,}CHANGELOG.md
##   mkdir -p scripts
##   ln -rs {${srcdir}/${pkgver}-,scripts/}gen_ref_nav.py
##   mkdir -p docs
#    sed -i -e "/dynamic/s/\"version\"//" -e "/urls/i version = \"${pkgver}\"" pyproject.toml
##   cp ${srcdir}/${pkgname}-${pkgver}{-,/}pdm.lock
##   export PDM_BUILD_SCM_VERSION=${pkgver}
#}

build() {
    cd "${_pyname}-${pkgver}"
#   cd "${pkgname}-${pkgver}"

    python -m build --wheel --no-isolation
}

#check() {
#    cd "${_pyname}-${pkgver}"
#    cd "${pkgname}-${pkgver}"  # use gh source

#    mkdir -p dist/lib
#    bsdtar -xpf dist/${_pyname/-/_}-${pkgver}-py3-none-any.whl -C dist/lib
#    PYTHONPATH="dist/lib" pytest -vv -l -ra --color=yes -o console_output_style=count #|| warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count
#}

package_mkdocs-coverage() {
    depends=('python>=3.8' 'mkdocs>=1.2')
    cd "${_pyname}-${pkgver}"

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

#package_mkdocs-coverage-doc() {
#    cd "${pkgbase}-${pkgver}"
#
#    install -D -m644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgname%-doc}"
#    cp -a site "${pkgdir}/usr/share/doc/${pkgname%-doc}"
#}
