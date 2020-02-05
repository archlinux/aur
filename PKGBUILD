# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
_modulename=giotto-tda
pkgname=python-$_modulename
pkgver=0.1.4
pkgrel=2
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
    ripser::https://github.com/scikit-tda/ripser.py/archive/v0.4.1.tar.gz
    gudhi-devel::https://github.com/giotto-ai/gudhi-devel/archive/a5476516e0d1d56842a15c5a79af0df3c1e50c5b.tar.gz # branch 'giotto' at the time of writing
    pybind11::https://github.com/pybind/pybind11/archive/v2.4.3.tar.gz
    
)
sha256sums=(
    '8676620ffcd9ce5ec5e4fc1bbf830a247c26e8cd5e466d0d2bf5a29e12067e9a' 
    'ec7f34935f5e6d3430c7f5a27007ccf4f50a21936d4045c0d3aa1e77209ef8fa'
    '360c774dfa67d7a364307c2ec90a9f6a2cc518a15f6301de644e67b40286390d'
    '1eed57bc6863190e35637290f97a20c81cfe4d9090ac0a24f3bbf08f265eb71d'
)

prepare() {
    cd "$srcdir/$_modulename-$pkgver"
    sed -i '/self.install_dependencies/d' setup.py

    rm -r gtda/externals/ripser 
    mv ../ripser.py-0.4.1 gtda/externals/ripser

    rm -r gtda/externals/gudhi-devel
    mv ../gudhi-devel-a5476516e0d1d56842a15c5a79af0df3c1e50c5b  gtda/externals/gudhi-devel

    mv ../pybind11-2.4.3 gtda/externals/pybind11
}

package() {
  cd "$srcdir/$_modulename-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

