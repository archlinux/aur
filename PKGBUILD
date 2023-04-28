# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=mkdocs-coverage
pkgname=("${pkgbase}")
#"${pkgbase}-doc")
_pyname=("${pkgbase//-/_}")
#_pyname=("${pkgbase}")
pkgver=0.2.7
pkgrel=1
pkgdesc="MkDocs plugin to integrate your coverage HTML report into your site"
url="https://pawamoy.github.io/mkdocs-coverage"
license=('ISC')
arch=("any")
makedepends=('python-pdm-backend'
             'python-build'
             'python-installer')
#checkdepends=('python-pytest'
#              'python-markdown-callouts'
#              'python-markdown-exec'
#              'python-toml'
#              'mkdocs-gen-files'
#              'mkdocs-literate-nav'
#              'mkdocs-material'
#              'python-mkdocs-section-index'
#              'mkdocstrings-python')   #  FileNotFoundError: [Errno 2] No such file or directory: 'pdm.lock'
#source=("https://github.com/pawamoy/mkdocs-coverage/archive/refs/tags/${pkgver}.tar.gz")
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
#        "${pkgver}-mkdocs.yml::https://github.com/pawamoy/mkdocs-coverage/raw/${pkgver}/mkdocs.yml"
#        "${pkgver}-CONTRIBUTING.md::https://github.com/pawamoy/mkdocs-coverage/raw/${pkgver}/CONTRIBUTING.md"
#        "${pkgver}-CHANGELOG.md::https://github.com/pawamoy/mkdocs-coverage/raw/${pkgver}/CHANGELOG.md"
#        "${pkgver}-gen_ref_nav.py::https://github.com/pawamoy/mkdocs-coverage/raw/${pkgver}/scripts/gen_ref_nav.py"
#        )
sha256sums=('3616b2508f0197158e684cdb1a08e558c14d435ea3b79e34f71b2f024f6e022b')

#prepare() {
#    cd "${_pyname}-${pkgver}"
#
##   ln -rs {${srcdir}/${pkgver}-,}mkdocs.yml
##   ln -rs {${srcdir}/${pkgver}-,}CONTRIBUTING.md
##   ln -rs {${srcdir}/${pkgver}-,}CHANGELOG.md
##   mkdir -p scripts
##   ln -rs {${srcdir}/${pkgver}-,scripts/}gen_ref_nav.py
##   mkdir -p docs
#    sed -i -e "/dynamic/s/\"version\"//" -e "/urls/i version = \"${pkgver}\"" pyproject.toml
#}

build() {
    cd "${_pyname}-${pkgver}"

    python -m build --wheel --no-isolation
}

#check() {
#    cd "${_pyname}-${pkgver}"  # use gh source
#
#    mkdir -p dist/lib
#    bsdtar -xpf dist/${_pyname/-/_}-${pkgver}-py3-none-any.whl -C dist/lib
#    PYTHONPATH="dist/lib" pytest -vv --color=yes #|| warning "Tests failed" # -vv --color=yes
#}

package_mkdocs-coverage() {
    depends=('python>=3.7' 'mkdocs>=1.2')
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
