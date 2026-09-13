# Maintainer: Edmund Lodewijks <edmund@proteamail.com>

pkgname=python-desec-dns
_name=desec_dns
pkgver=1.5.0
pkgrel=1
pkgdesc="A simple deSEC.io API client"
arch=(any)
url="https://github.com/s-hamann/desec-dns"
license=('MIT')
depends=(
  python
  python-requests
  python-cryptography
  python-dnspython
)
makedepends=(
  python-build
  python-installer
  python-poetry-core
  python-wheel
)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=('e05fc9d7f25d3fbaf8ebbb4d66201a022d760d2696d91f17d296b00913a7ef34ba82db6f719b8f9158769abdc1f8e21e491cc50cda680e5638baa1432c2309cd')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s "$site_packages"/$_name-$pkgver.dist-info/licenses/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
