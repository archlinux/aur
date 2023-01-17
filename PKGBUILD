# Maintainer:  Anton Kudelin <kudelin at proton dot me>

_pkgname=xarray-einstats
pkgname=python-$_pkgname
pkgver=0.5.0
pkgrel=1
pkgdesc='Stats, linear algebra and einops for xarray'
arch=('any')
url='https://einstats.python.arviz.org'
license=('Apache')
depends=('python-scipy' 'python-xarray' 'python-pytest')
makedepends=('python-poetry' 'python-build' 'python-installer'
             'python-flit-core')
optdepends=('python-dask')
checkdepends=('python-numba' 'python-einops')
source=($pkgname-$pkgver.tar.gz::"https://github.com/arviz-devs/$_pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b3c74e46f32dd8dad5955d896cf832e5a38e2ebfa6d7058425928910a5f50601')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" --compile-bytecode=1 dist/*.whl
}
