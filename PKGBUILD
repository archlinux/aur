# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=catppuccin
pkgname="python-$_pkgname"
pkgver=2.1.0
pkgrel=1
pkgdesc="Soothing pastel theme for Python"
arch=('any')
url="https://catppuccin-website.vercel.app"
license=('MIT')
depends=('python')
makedepends=(
  'python-build' 'python-installer' 'python-wheel'
  'python-poetry-core' 'python-poetry-dynamic-versioning'
)
checkdepends=('python-pytest' 'python-pygments' 'python-rich')
optdepends=(
  'python-pygments: For pygments integration'
  'python-rich: For rich integration'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/catppuccin/python/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('85ec2c4f553ea7199f187941cbf95fa415106de270f57f2e6ba3f7e84f7024f0')
b2sums=('338280f308068bba9cd27e2fdf646071a6a47f68c238d2611f3660e489bbbe8f5ebab853c4e5fcbe929f3629ae0e05bca5ea80adca9f3738e763309ad5144c88')

prepare() {
  cd "python-$pkgver"

  mv build.py build_palette.py
}

build() {
  cd "python-$pkgver"

  export POETRY_DYNAMIC_VERSIONING_BYPASS="$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "python-$pkgver"

  pytest
}

package() {
  cd "python-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
