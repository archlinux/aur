# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-griffe-inherited-docstrings
_pname=${pkgbase#python-}
_pyname=${_pname//-/_}
pkgname=("python-${_pname}")
#"python-${_pname}-doc")
pkgver=1.1.2
pkgrel=1
pkgdesc="Griffe extension for inheriting docstrings."
arch=('any')
url="https://mkdocstrings.github.io/griffe-inherited-docstrings"
license=('ISC')
makedepends=('python-pdm-backend'
             'python-build'
             'python-installer')
checkdepends=('python-pytest'
              'python-griffe'
              'mkdocstrings')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('7d952d97360452f2031663e8e74c9104')

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
#   bsdtar -xpf dist/${_pyname//-/_}-${pkgver}-py3-none-any.whl -C dist/lib
#   PYTHONPATH="dist/lib" mkdocs build
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

#   mkdir -p dist/lib
#   bsdtar -xpf dist/${_pyname//-/_}-${pkgver}-py3-none-any.whl -C dist/lib
#   PYTHONPATH="dist/lib" pytest -vv -l -ra --color=yes -o console_output_style=count # || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count #
    PYTHONPATH="src" pytest || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count #
}

package_python-griffe-inherited-docstrings() {
    depends=('python-griffe>=1.14')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

#package_python-markdown-griffe-inherited-docstrings-doc() {
#    pkgdesc="Documentation for griffe-inherited-docstrings"
#    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build
#
#    install -D -m644 ../../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
#}
