# Maintainer: Astro Benzene <universebenzene at sina dot com>
# Maintainer: Dominik Stańczak <stanczakdominik at gmail dot com>
# Maintainer: xia0er <xia0er at gmail dot com>

pkgbase=python-pymc3
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
#"python-${_pyname}-doc")
pkgver=3.11.5
pkgrel=1
pkgdesc="Probabilistic Programming in Python. Uses Theano as a backend, supports NUTS and ADVI."
arch=('any')
url="https://www.pymc.io/projects/docs/en/v3.11.5"
license=('APACHE')
makedepends=('python-setuptools'
             'python-wheel'
             'python-build'
             'python-installer')
#checkdepends=('python-pytest'
#              'python-semver'
#              'python-theano-pymc'
#              'python-dill'
#              'python-deprecat'
#              'python-cachetools'
#              'python-pandas'
#              'python-arviz'
#              'python-typing_extensions'
#              'python-fastprogress')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
sha256sums=('3341cbbd962909138b7d5ebe4ed7cfee29f40b2fe7cadeb888b39d6bbc17138c')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

#   msg "Building Docs"
#   cd ${srcdir}/${_pyname}-${pkgver}/docs
#   PYTHONPATH="../build/lib" make html
}

#check() {
#    cd ${srcdir}/${_pyname}-${pkgver}
#
#    pytest || warning "Tests failed"
#}

package_python-pymc3() {
    depends=('python>=3.7'
             'python-arviz>=0.11.0'
             'python-cachetools'
             'python-deprecat'
             'python-dill'
             'python-fastprogress>=0.2.0'
             'python-pandas>=0.24.0'
             'python-patsy>=0.5.1'
             'python-scipy>=1.7.3'
             'python-semver>=2.13.0'
             'python-theano-pymc'
             'python-typing_extensions>=3.7.4')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

#package_python-pymc3-doc() {
#    pkgdesc="Documentation for PyMC3"
#    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build
#
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
#}
