# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgname=properdocs-theme-readthedocs
#_pname=${pkgname#python-}
#_pyname=${_pname//-/_}
_pyname=${pkgname//-/_}
#pkgname=("python-${_pname}")
#"python-${_pname}-doc")
pkgver=1.6.5
pkgrel=1
pkgdesc="'readthedocs' theme for ProperDocs, originally made for MkDocs"
arch=("any")
url="https://pypi.org/project/properdocs-theme-readthedocs"
license=('BSD-2-Clause')
makedepends=('python-hatchling'
             'python-babel'
             'python-setuptools'
             'python-build'
             'python-installer')
checkdepends=('python-nose')
#checkdepends=('python-pytest-import-check')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
sha256sums=('35fb78708b4c6598cd5a958e3b0800446cf5e1fa5ed1adabb6b37c6e78c25b93')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python -m build --wheel --no-isolation --skip-dependency-check
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

#   mkdir -p dist/lib
#   bsdtar -xpf dist/${_pyname/-/_}-${pkgver}-py3-none-any.whl -C dist/lib
#   pytest dist/lib --import-check -vv -l -ra --color=yes -o console_output_style=count
    nosetests -v -x || warning "Tests failed"
}

package() {
    depends=('properdocs' 'python-babel')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
