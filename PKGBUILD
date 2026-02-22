# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-optimagic
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
#   "python-${_pyname}-doc")
pkgver=0.5.3
pkgrel=1
pkgdesc="Tools to solve difficult numerical optimization problems"
arch=('any')
url="https://optimagic.readthedocs.io"
license=('MIT')
makedepends=('python-hatchling'
             'python-hatch-vcs'
             'python-build'
             'python-installer')  # wheel required by new setuptools
#             'python-sphinx-copybutton'
#             'python-sphinx-panels'
#             'python-sphinx-furo'
#             'python-sphinx_design'
#             'python-sphinxcontrib-bibtex'
#             'python-sphinxcontrib-mermaid'
#             'python-intersphinx-registry'
#             'python-myst-nb'
#             'python-pandas'
#             'python-plotly'
#             'python-pybaum'
#             'python-annotated-types'
#             'python-scipy'
checkdepends=('python-pytest'
#             'python-pytest-xdist'
              'python-pandas'
              'python-statsmodels'
              'python-annotated-types'
              'python-sqlalchemy'
              'python-cloudpickle'
              'python-pybaum'
              'python-joblib'
              'python-plotly'
              'python-yaml'
              'python-seaborn'
              'python-bokeh'
              'python-iminuit'
              'python-altair') # typing_extensions <- sqlalchemy; jinja <- bokeh
##            'python-bayesian-optimization'
##            'python-colorama'
##)
#source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
source=("https://github.com/optimagic-dev/optimagic/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('b7e138d22cdadfb7006733ecfa52b8a6')

get_pyver() {
    python -c "import sys; print('$1'.join(map(str, sys.version_info[:2])))"
}

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

#   sed -i -e "s/@/\%s@/" -e "/pulls/s/\#/\%s\#/" docs/source/conf.py
    export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

#   msg "Building Docs"
#   mkdir -p dist/lib
#   bsdtar -xpf dist/${_pyname/-/_}-${pkgver}-py3-none-any.whl -C dist/lib
#   PYTHONPATH="../dist/lib" make -C docs html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    PYTHONPATH="src" pytest \
        --ignore=tests/optimagic/optimizers/test_bayesian_optimizer.py || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 #
#        --deselect=tests/optimagic/visualization/test_backends.py::test_line_plot_all_backends[altair] \
#        --deselect=tests/optimagic/visualization/test_convergence_plot.py::test_convergence_plot_options[True-options13] \
#        --deselect=tests/optimagic/visualization/test_convergence_plot.py::test_convergence_plot_options[False-options13] \
#        --deselect=tests/optimagic/visualization/test_history_plots.py::test_criterion_plot_different_backends[altair] \
#        --deselect=tests/optimagic/visualization/test_history_plots.py::test_params_plot_different_backends[altair] \
#        --deselect=tests/optimagic/visualization/test_slice_plot.py::test_slice_plot[sphere_loglike-kwargs1-altair] \
#        --deselect=tests/optimagic/visualization/test_slice_plot.py::test_slice_plot[sphere_loglike-kwargs2-altair] \
#        --deselect=tests/optimagic/visualization/test_slice_plot.py::test_slice_plot[sphere_loglike-kwargs3-altair] \
#        --deselect=tests/optimagic/visualization/test_slice_plot.py::test_slice_plot[sphere_loglike-kwargs4-altair] \
#        --deselect=tests/optimagic/visualization/test_slice_plot.py::test_slice_plot[sphere_loglike-kwargs6-altair] \
#        --deselect=tests/optimagic/visualization/test_slice_plot.py::test_slice_plot[sphere_loglike-kwargs5-altair] \
#        --deselect=tests/optimagic/visualization/test_slice_plot.py::test_slice_plot[sphere-kwargs8-altair] \
#        --deselect=tests/optimagic/visualization/test_slice_plot.py::test_slice_plot[sphere_loglike-kwargs7-altair] \
#        --deselect=tests/optimagic/visualization/test_slice_plot.py::test_slice_plot[sphere-kwargs9-altair] \
#        --deselect=tests/optimagic/visualization/test_slice_plot.py::test_slice_plot[sphere-kwargs10-altair] \
#        --deselect=tests/optimagic/visualization/test_slice_plot.py::test_slice_plot[sphere-kwargs12-altair] \
#        --deselect=tests/optimagic/visualization/test_slice_plot.py::test_slice_plot[sphere-kwargs11-altair] \
#        --deselect=tests/optimagic/visualization/test_slice_plot.py::test_slice_plot[sphere-kwargs13-altair] \
#        --deselect=tests/optimagic/visualization/test_slice_plot.py::test_slice_plot[sphere-kwargs14-altair] \
#        --deselect=tests/optimagic/visualization/test_slice_plot.py::test_slice_plot[sphere-kwargs15-altair] \
#        --deselect=tests/optimagic/visualization/test_profile_plot.py::test_profile_plot_options[options5] \
#        --deselect=tests/optimagic/visualization/test_slice_plot.py::test_slice_plot[sphere_loglike-kwargs0-altair]

        #|| warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 #
#       --deselect=tests/optimagic/optimization/test_many_algorithms.py::test_nag_dfols_starting_at_optimum \
#       --deselect=parfive/tests/test_downloader.py::test_ftp #|| warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 #
}

package_python-optimagic() {
    depends=('python>=3.10'
             'python-cloudpickle'
             'python-joblib'
             'python-numpy'
             'python-pandas'
             'python-plotly'
             'python-pybaum>=0.1.2'
             'python-scipy>=1.2.1'
             'python-sqlalchemy>=1.3'
             'python-annotated-types'
             'python-typing_extensions')
#   optdepends=('python-optimagic-doc: Documentation for optimagic')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
#package_python-optimagic-doc() {
#    pkgdesc="Documentation for Python optimagic"
#    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build
#
#    install -D -m644 ../../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
#}
