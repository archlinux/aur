# Maintainer:  Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Julian Mehne <julian (dot) mehne (at) posteo (dot) de>
# Contributor: renyuneyun <renyuneyun (at) gmail (dot) com>
_name=octave_kernel
pkgname=jupyter-${_name}
pkgver=0.36.0
pkgrel=2
pkgdesc="A Jupyter kernel for Octave"
arch=(any)
url=https://github.com/Calysto/octave_kernel
license=(BSD-3-Clause)
depends=(
    jupyter-metakernel
    octave
    python-ipykernel
    python-jupyter_client
)
makedepends=(
    python-build
    python-hatchling
    python-installer
)
optdepends=(
    'gnuplot: for making plots'
    'jupyterlab: JupyterLab computational environment'
)
source=($pkgname-$pkgver.tar.gz::https://github.com/Calysto/octave_kernel/archive/v$pkgver.tar.gz)
b2sums=('be770836a40ad084b0ac80f9a00333916c071d653bfb628fd0de43c04abba695733081afed1b1545e465c67d9eca1303148300dc2091c5658337568aa00a0152')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
