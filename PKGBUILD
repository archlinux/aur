# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-gammapy
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
#"python-${_pyname}-doc")
pkgver=2.0
pkgrel=1
pkgdesc="A Python package for gamma-ray astronomy"
arch=('i686' 'x86_64')
url="https://gammapy.org"
license=('BSD-3-Clause')
makedepends=('cython'
             'python-setuptools-scm>=8'
             'python-build'
             'python-installer'
             'python-numpy')  # wheel required by new setuptools
#checkdepends=(
#    'python-pytest-astropy-header'
#             'python-pytest-xdist'
#              'python-pytest-remotedata'
#              'python-scipy'
#              'python-astropy'
#              'python-regions'
#              'python-click'
#              'python-matplotlib'
#              'python-pydantic'
#              'python-iminuit'
#              'python-healpy'
#              'python-tqdm'
#              'python-naima'
#              'python-ipywidgets'
#              'python-numba'
#              'python-sherpa'
#             )
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
#       "gammapy-data-${pkgver}.tar.gz::https://github.com/gammapy/gammapy-data/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('740b4790c2203554788c3f621524788e')

get_pyver() {
    python -c "import sys; print('$1'.join(map(str, sys.version_info[:2])))"
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

#   msg "Building Docs"
#   python setup.py build_docs
}

#check() {
#    cd ${srcdir}/${_pyname}-${pkgver}
#
#    ln -rs ${srcdir}/${_pyname}-${pkgver}/${_pyname}*egg-info \
#        build/lib.linux-${CARCH}-cpython-$(get_pyver)/${_pyname}-${pkgver}-py$(get_pyver .).egg-info
##   PYTHONPATH="build/lib.linux-${CARCH}-cpython-$(get_pyver)" pytest \
##        -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 --remote-data #"build/lib.linux-${CARCH}-cpython-$(get_pyver)" || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 --remote-data #
#    ls "${srcdir}/gammapy-data-${pkgver}"
#    GAMMAPY_DATA="${srcdir}/gammapy-data-${pkgver}" PYTHONPATH="build/lib.linux-${CARCH}-cpython-$(get_pyver)" pytest \
#        -vv -l -ra --color=yes -o console_output_style=count --remote-data=any "build/lib.linux-${CARCH}-cpython-$(get_pyver)" \
#        --deselect=build/lib.linux-${CARCH}-cpython-$(get_pyver)/gammapy/data/tests/test_obs_table.py::test_basics \
#        --deselect=build/lib.linux-${CARCH}-cpython-$(get_pyver)/gammapy/data/tests/test_obs_table.py::test_select_parameter_box \
#        --deselect=build/lib.linux-${CARCH}-cpython-$(get_pyver)/gammapy/data/tests/test_obs_table.py::test_select_sky_regions \
#        --deselect=build/lib.linux-${CARCH}-cpython-$(get_pyver)/gammapy/data/tests/test_pointing.py::test_fixed_pointing_icrs \
#        --deselect=build/lib.linux-${CARCH}-cpython-$(get_pyver)/gammapy/data/tests/test_pointing.py::test_fixed_pointing_info_altaz \
#        --deselect=build/lib.linux-${CARCH}-cpython-$(get_pyver)/gammapy/makers/tests/test_reduce.py
#        #--remote-data # || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 --remote-data #
##   PYTHONPATH="build/lib.linux-${CARCH}-cpython-$(get_pyver)" pytest -vv --color=yes
##   pytest "build/lib.linux-${CARCH}-cpython-$(get_pyver)" #|| warning "Tests failed" # -vv --color=yes
#}

package_python-gammapy() {
    depends=('python>=3.10' 'python-scipy>=1.13' 'python-yaml>=5.3' 'python-astropy>=6.0' 'python-regions>=0.9.0' 'python-click>=8.0' 'python-pydantic>=2.8.0' 'python-iminuit>=2.26.0' 'python-matplotlib>=3.8')
    optdepends=('python-pandas: For working with tables'
                'python-emcee: For fitting by MCMC sampling'
                'python-corner: For MCMC corner plots'
                'python-healpy: For HEALPIX data handling'
                'python-naima: For SED modeling'
#               'python-gammapy-doc: Documentation for Gammapy'
#               'python-pytest-astropy: For testing'
                'python-sherpa: For modelling and fitting'
                'python-parfive: For example data and tutorial notebook download')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

#package_python-gammapy-doc() {
#    pkgdesc="Documentation for Gammapy"
#    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build
#
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
#}
