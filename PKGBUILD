# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=catppuccin
pkgname="python-$_pkgname"
pkgver=2.5.0
pkgrel=1
pkgdesc="Soothing pastel theme for Python"
arch=('any')
url="https://catppuccin-website.vercel.app"
license=('MIT')
depends=('python')
makedepends=(
  'python-build' 'python-installer' 'python-wheel'
  'python-hatchling'
)
checkdepends=(
  'python-pytest' 'python-pygments' 'python-rich'
  'python-matplotlib'
)
optdepends=(
  'python-pygments: For pygments integration'
  'python-rich: For rich integration'
  'python-matplotlib: For matplotlib integration'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/catppuccin/python/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1cbdc52eead30a13aff85cc9f1285832ea1e145f59caf2157be3e997827eee2b')
b2sums=('a160cd434997bcea10889ebfe772bd20716b731e71e3b45a9e23fc562bd433b1f0e35ec77e18dc5ff9961b11ede57eef81295a70137da8e704e9fc6795105859')

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
