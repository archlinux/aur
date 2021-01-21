# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
_modulename=giotto-tda
pkgname=python-$_modulename
pkgver=0.4.0
pkgrel=0
pkgdesc="A high performance topological machine learning toolbox in Python"
arch=(any)
url="https://github.com/giotto-ai/giotto-tda"
license=('AGPL')
groups=()
depends=('python' 'python-numpy' 'python-scipy' 'python-joblib' 'python-scikit-learn' 'python-igraph' 'python-matplotlib' 'python-plotly' 'python-ipywidgets')
makedepends=('python-setuptools')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(
    "${url}/archive/v${pkgver}.tar.gz" 
    eigen::https://gitlab.com/libeigen/eigen/repository/25424d91f60a9f858e7dc1c7936021cc1dd72019/archive.zip
    hera::https://github.com/grey-narn/hera/archive/2c5e6c606ee37cd68bbe9f9915dba99f7677dd87.tar.gz
    pybind11::https://github.com/pybind/pybind11/archive/8fa70e74838e93f0db38417f3590ba792489b958.tar.gz
    gudhi-devel::https://github.com/giotto-ai/gudhi-devel/archive/a265b030effa9b34a99a09b0e1b5073e8bb50cb6.tar.gz
    ripser::https://github.com/scikit-tda/ripser.py/archive/f784e1f381094219316855c4dc6c2abd494a8a07.tar.gz
    robinhood::https://github.com/martinus/robin-hood-hashing/archive/c0801327ea589d8f0f941aa5d3ca4f9f770f4ea9.tar.gz
)
sha256sums=(
    'b003676875a2e8984ba59360947024bc5737a746f4caeb0727c7476170e64813'
    '20ed040d961815f55ed1a43e8fdfca36611b7337c7632c4c9094c5e0781935ea'
    '81ec8065587edac9ff5831f9a56a2deb0aaf1626c8358b1553df0e5029edd91f'
    '7b350a5c42e598f9e72b5faa06f3b472924639c859cdc0e53fccdf84f84a91ec'
    '61aec3fa7ecf7e121a32d621077fe261eb436b205954ad26b6f61027064f2cc9'
    '03a3b3a4a51d8cf44187bcdc6beb96914a7f9d0f541ce6f7292970cd511bb51d'
    '31b7f43dff9ad7aaa15936dd530839ac71640f98cb02b3144bd68ed7efed10ce'
)

prepare() {
    cd "$srcdir/$_modulename-$pkgver"
    sed -i '/self.install_dependencies/d' setup.py
    rm -r gtda/externals/eigen 
    mv ../eigen-* gtda/externals/eigen

    rm -r gtda/externals/hera 
    mv ../hera-* gtda/externals/hera

    rm -r gtda/externals/pybind11 
    mv ../pybind11-* gtda/externals/pybind11

    rm -r gtda/externals/ripser 
    mv ../ripser.py-* gtda/externals/ripser

    rm -r gtda/externals/gudhi-devel
    mv ../gudhi-devel-*   gtda/externals/gudhi-devel

    rm -r gtda/externals/robinhood  
    mv ../robin-hood-*  gtda/externals/robinhood

}

package() {
  cd "$srcdir/$_modulename-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

