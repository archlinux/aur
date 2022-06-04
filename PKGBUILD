# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-runnotebook
_pname=${pkgbase#python-}
_pyname=RunNotebook
pkgname=("python-${_pname}")
#"python-${_pname}-example")
pkgver=0.3.1
pkgrel=1
pkgdesc="IPython notebook sphinx extensions"
arch=('any')
url="https://github.com/ngoldbaum/RunNotebook"
license=('BSD')
makedepends=('python-setuptools')
#            'python-wheel'
#            'python-build'
#            'python-installer'
#            'python-sphinx')
checkdepends=('python-nose'
              'jupyter-nbformat'
              'jupyter-nbconvert'
              'python-docutils')
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/ngoldbaum/RunNotebook/master/LICENSE")
md5sums=('67ddf123b72f97369831ba684a426962'
         'SKIP')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
#   python -m build --wheel --no-isolation
    python setup.py build

#   msg "Building Examples"
#   cd ${srcdir}/${_pyname}-${pkgver}/example
#   PYTHONPATH="../build/lib" make html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    nosetests
}

package_python-runnotebook() {
    depends=('python-sphinx'
             'jupyter-notebook'
             'python-qtconsole'
             'jupyter_console'
             'jupyter-nbconvert'
             'python-ipykernel'
             'python-ipywidgets'
             'jupyter-nbformat')
    cd ${srcdir}/${_pyname}-${pkgver}
#   optdepends=('python-runnotebook-example: example documentation')

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ${srcdir}/LICENSE
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
#   python -m installer --destdir="${pkgdir}" dist/*.whl
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}

#package_python-runnotebook-example() {
#    pkgdesc="RunNotebook example documentation"
#    cd ${srcdir}/${_pyname}-${pkgver}/example/build
#
#    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../LICENSE
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
#}
