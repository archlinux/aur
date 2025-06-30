# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-markdown-exec
_pname=${pkgbase#python-}
_pyname=${_pname/-/_}
pkgname=("python-${_pname}")
#"python-${_pname}-doc")
pkgver=1.11.0
pkgrel=1
pkgdesc="Utilities to execute code blocks in Markdown files"
arch=('any')
url="https://pawamoy.github.io/markdown-exec"
license=('ISC')
makedepends=('python-pdm-backend'
             'python-build'
             'python-installer')
#            'mkdocs-material'
#            'mkdocs-gen-files'
#            'mkdocs-literate-nav'
#            'mkdocs-coverage'
#            'mkdocstrings-python'
#            'mkdocs-git-committers-plugin-2'
#            'python-markdown-callouts'
#            'python-pygments-ansi-color'
#            'python-diagrams'
#            'python-matplotlib'
#            'python-plotly'
#            'python-pydeps'
#            'python-rich'
#            'python-drawsvg'
#            'python-textual'
#            'python-pytermgui'
#            'python-chalk'
#            'python-qrcode'
#            'python-duty'
#            'python-hyperbolic'
#            'd2'
#            'github-cli')
checkdepends=('python-pytest'
              'python-griffe'
              'mkdocstrings')  # markupsafe <- mkdocstrings
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('ee710d4a077a5abb4f900efe9a25e2d1')

#prepare() {
#    cd ${srcdir}/${_pyname}-${pkgver}
#
#    sed -i '$a use_directory_urls: false' mkdocs.yml
#}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

#   msg "Building Docs"
#   mkdir -p dist/lib
#   bsdtar -xpf dist/${_pyname/-/_}-${pkgver}-py3-none-any.whl -C dist/lib
#   PYTHONPATH="dist/lib" mkdocs build
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

#   mkdir -p dist/lib
#   bsdtar -xpf dist/${_pyname/-/_}-${pkgver}-py3-none-any.whl -C dist/lib
#   PYTHONPATH="dist/lib" pytest -vv -l -ra --color=yes -o console_output_style=count # || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count #
    PYTHONPATH="src" pytest || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count #
}

package_python-markdown-exec() {
    depends=('python-pymdown-extensions>=9')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

#package_python-markdown-exec-doc() {
#    pkgdesc="Documentation for Markdown Exec"
#    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build
#
#    install -D -m644 ../../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
#}
