# Maintainer:  Michael (https://aur.archlinux.org/account/michael_wzq)
# Contributor: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=zxpy
pkgver=1.6.4
pkgrel=1
pkgdesc="Shell scripts made simple"
arch=('any')
url="https://github.com/tusharsadhwani/zxpy"
license=("MIT")
depends=("python")
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
)
checkdepends=(
  'python-pytest'
  # 'zxpy'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('f29ecff2aaab7296dcd06e8af3b3532699f9e9bcdf498294f52d3a880e80d8afefc852116d44176f13a1f9ed32bb52d9653a2c7ef8faa3410024bd168594daef')

build() {
  cd "$pkgname-$pkgver" || exit
  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname-$pkgver" || exit
  # pytest requires installation first
  true || pytest
}

package() {
  cd "$pkgname-$pkgver" || exit
  export PYTHONHASHSEED=0
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
