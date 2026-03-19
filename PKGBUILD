# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgname=properdocs-theme-mkdocs
#_pname=${pkgname#python-}
#_pyname=${_pname//-/_}
_pyname=${pkgname//-/_}
#pkgname=("python-${_pname}")
#"python-${_pname}-doc")
pkgver=1.6.5
pkgrel=1
pkgdesc="'mkdocs' theme for ProperDocs, originally made for MkDocs"
arch=("any")
url="https://github.com/missinglinkelectronics/sphinxcontrib-globalsubs"
license=('BSD-2-Clause')
makedepends=('python-hatchling'
             'python-babel'
             'python-setuptools'
             'python-build'
             'python-installer')
checkdepends=('python-nose')
#checkdepends=('python-pytest-import-check')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
sha256sums=('fcc10d0e6b0d0cd01a4677d4252880f91ea39a227aab545a0fbd8530e57b8019')

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
