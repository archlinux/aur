# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-multiformats-config
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
#"python-${_pyname}-doc")
pkgver=0.3.1
pkgrel=1
pkgdesc="Pre-loading configuration module for the 'multiformats' package"
arch=('any')
url="https://github.com/hashberg-io/multiformats-config"
license=('MIT')
makedepends=('python-setuptools-scm>=6.2'
             'python-build'
             'python-installer')  # wheel required by new setuptools
#checkdepends=('python-pytest'
#              'python-pytest-xdist'
#              )
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('18cadff458c6b8aececd914840890d71')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation #--skip-dependency-check

#   msg "Building Docs"
#   PYTHONPATH="../build/lib" make -C docs html
}

#check() {
#    cd ${srcdir}/${_pyname}-${pkgver}
#
#    pytest -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 # || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 #
#}

package_python-multiformats-config() {
    depends=('python>=3.7')
    #'python-multiformats for post dep
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

#package_python-multiformats-doc() {
#    pkgdesc="Documentation for Python multiformats"
#    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build
#
#    install -D -m644 ../../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
#}
