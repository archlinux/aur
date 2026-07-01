# Maintainer: Edmund Lodewijks <edmund@proteamail.com>

pkgname=python-desec-dns
_name=desec_dns
pkgver=1.4.0
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
b2sums=('6f1f3140f9f7a1df1ad96e822f274e26eaf98d32cfe0098d6b53c5201098435358a9a7ef842becc5b249fb2249e2640eacfe80b4e7684f2c10508459d9b96060')

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
