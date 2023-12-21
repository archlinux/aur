# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-pytest-textual-snapshot
#"python-${_pyname}-doc")
_pname=${pkgbase#python-}
_pyname=${_pname//-/_}
pkgname=("python-${_pname}")
pkgver=0.4.0
pkgrel=1
pkgdesc="Snapshot testing for Textual apps"
arch=('any')
url="https://github.com/Textualize/pytest-textual-snapshot"
license=('MIT')
makedepends=('python-poetry-core'
             'python-build'
             'python-installer')
checkdepends=('python-nose')
#source=("https://github.com/Textualize/pytest-textual-snapshot/archive/refs/tags/v${pkgver}.tar.gz")
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('5842a00bf14bf764dbc309b8fe6eddf5')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python -m build --wheel --no-isolation
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    nosetests || warning "Tests failed" # -v -x
}

package_python-pytest-textual-snapshot() {
    depends=('python>=3.6'
             'python-pytest>=7.0.0'
             'python-jinja>=3.0.0'
             'python-rich>=12.0.0'
             'python-syrupy>=3.0.0'
             'python-textual>=0.28.0')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
