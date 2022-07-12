# Maintainer: Astro Benzene <universebenzene at sina dot com>
_pyname=poliastro
pkgname=python-${_pyname}-doc
pkgver=0.17.0
pkgrel=1
pkgdesc="Documentation for Python poliastro module"
arch=('any')
url="http://docs.poliastro.space"
license=('MIT')
makedepends=("python-${_pyname}=${pkgver}"
             'python-sphinx-copybutton'
             'pandoc'
#            'python-pandas'
#            'python-beautifulsoup4'
#            'python-plotly>=4.0.0'
             'python-nbsphinx>=0.8.6'
             'python-sphinx-autoapi'
             'python-sphinx_rtd_theme'
             'python-sphinx-notfound-page'
             'python-sphinx-gallery'
             'python-sphinx-hoverxref'
             'python-docutils<1:0.19'
             'python-sphinx-github-role'
             'python-myst-parser'
             'python-jupytext'
#            'python-jplephem'
#            'python-tenacity'
             'python-httpx'
             'python-czml3'
             'python-sgp4'
             'python-numba>0.55.2'
             'python-llvmlite>=0.39.0')
#            'graphviz')
source=("https://github.com/poliastro/poliastro/archive/v${pkgver}.tar.gz"
        'fix_nbsphinx_errors.patch')
md5sums=('ebea4f9b1b337304eb8d3c17dcd16c9c'
         '92c9d10567556123b294c89645a5e4c8')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

#   patch -Np1 -i "${srcdir}/fix_nbsphinx_errors.patch"
    sed "/^github_default_org_project/a nbsphinx_allow_errors = True\nnbsphinx_timeout = -1" \
        -i docs/source/conf.py
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}/docs

    make html
}

package() {
    cd ${srcdir}/${_pyname}-${pkgver}/docs/build

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../COPYING
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgname%-doc}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgname%-doc}"
}
