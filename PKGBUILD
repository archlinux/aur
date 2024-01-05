# Maintainer: Bipin Kumar <bipin@ccmb.res.in>

pkgname=rnalysis
_name=RNAlysis
pkgver=3.11
pkgrel=1
pkgdesc='Python-based software for analyzing RNA sequencing data. https://doi.org/10.1101/2022.11.25.517851'
_pkgdesc='Python-based software with GUI for analyzing RNA sequencing data'
arch=(any)
url=https://github.com/GuyTeichman/RNAlysis
license=(MIT)
depends=(
         'python'
         'cython'
         'python-numpy' 
         'python-pandas'
         'python-scipy'
         'python-matplotlib'
         'python-requests'
         'python-scikit-learn'
         'python-seaborn'
         'python-statsmodels'
         'python-joblib'
         'python-tqdm'
         'python-appdirs'
         'python-yaml'
         'python-pyqt5'
         'python-qdarkstyle'
         'qt5-imageformats'
         'python-aiodns'
         'python-defusedxml'
         'python-aiohttp'
         'python-brotli'
         'python-networkx'
         'python-typing_extensions'
         'graphviz'
         'python-graphviz'
         'r'
         'cutadapt'
         'python-numba'
         'python-hdbscan'
         'python-matplotlib-venn'
         'kallisto'
         'python-scikit-learn-extra'
         'python-grid-strategy'
         'python-upsetplot'
         'python-xlmhglite'
         'python-plotly'
         'python-pairwisedist'
         'python-aiolimiter'
         'python-pyvis'
        )

makedepends=(
             'python-pip'
             'gendesk'
             'twine'
             'python-setuptools'
             'python-setuptools-scm'
             'python-sphinx'
             'python-wheel'
             'python-installer'
             'python-build'
             'python-sphinx_rtd_theme'
            'python-pytest-runner'
            'python-pytest'
            'python-anyio'
            'python-pytest-xvfb'
            'python-pytest-qt'
            'python-coverage'
             )

source=(${_name}-${pkgver}.tar.gz::https://github.com/GuyTeichman/RNAlysis/archive/refs/tags/V"${pkgver}".tar.gz
        )

sha256sums=('373c393d35397402eccf78daba05d17a4a2e6fde0f4f957ec47c790a57cdfd9c')

prepare() {
    cd "$_name-$pkgver"
    gendesk --exec='/usr/bin/rnalysis-gui' --pkgname "$_name" --pkgdesc "$_pkgdesc" -n --icon=RNAlysis --categories=Science
}

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

check(){

    export QT_DEBUG_PLUGINS=1
    cd "$_name-$pkgver"
    python setup.py pytest | tee check.log
}

package() {

    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 RNAlysis.desktop -t "$pkgdir"/usr/share/applications/
    install -Dm644 docs/source/RNAlysis.svg -t "$pkgdir"/usr/share/pixmaps/
}
