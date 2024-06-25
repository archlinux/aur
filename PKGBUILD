# Maintainer: Bipin Kumar <kbipinkumar@pm.me>

pkgname=rnalysis
_name=RNAlysis
pkgver=3.12.0
pkgrel=2
pkgdesc='Python-based software for analyzing RNA sequencing data. https://doi.org/10.1101/2022.11.25.517851'
_pkgdesc='Python-based GUI tool for analyzing RNA sequencing data'
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
         'python-nest-asyncio'
        )

makedepends=(
             'python-pip'
             'git'
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

#source=(${_name}-${pkgver}.tar.gz::https://github.com/GuyTeichman/RNAlysis/archive/refs/tags/V"${pkgver}".tar.gz
       # )
source=("git+https://github.com/GuyTeichman/RNAlysis.git#tag=V$pkgver"
	)

#sha256sums=('03eb4e19a306e746e6f7d42bb2f77b72ec07b2cafbf54a941ff0038f72b57b16')
sha256sums=('e724cf9dadb7f1e9ed29606f518fa46f2a61715d6345786282c8e91cfc660abe')


prepare() {
    #cd "$_name-$pkgver"
    cd "$_name"
    gendesk --exec='/usr/bin/rnalysis-gui' --pkgname "$_name" --pkgdesc "$_pkgdesc" -n --icon=RNAlysis --categories=Science
}

build() {
    #cd "$_name-$pkgver"
    cd "$_name"
    python -m build --wheel --no-isolation
}

check(){

    export QT_DEBUG_PLUGINS=1
    #cd "$_name-$pkgver"
    cd "$_name"
    python setup.py pytest | tee check.log
}

package() {

    #cd "$_name-$pkgver"
    cd "$_name"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 RNAlysis.desktop -t "$pkgdir"/usr/share/applications/
    install -Dm644 docs/source/RNAlysis.svg -t "$pkgdir"/usr/share/pixmaps/
}
