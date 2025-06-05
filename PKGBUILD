# Maintainer: Bipin Kumar <kbipinkumar@pm.me>

pkgname=rnalysis
_name=RNAlysis
pkgver=4.1.2
pkgrel=1
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
         'python-pyqt6'
         'python-qdarkstyle'
         'qt6-imageformats'
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
         'python-polars'
         'python-kmedoids'
         'picard-tools'
         'python-mslex'
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

source=("git+https://github.com/GuyTeichman/RNAlysis.git#tag=V$pkgver"
	)
sha256sums=('e410119f77267355e139b385fc5db95629cb0da86a680f37adeae6fa24731c87')


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
