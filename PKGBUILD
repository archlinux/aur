# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-strenum
_name=StrEnum
pkgver=0.4.12
pkgrel=1
pkgdesc="A Python Enum that inherits from str."
arch=('any')
url="https://github.com/irgeek/StrEnum"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-pytest-runner'
             'python-setuptools' 'python-wheel')
checkdepends=('python-pytest-black' 'python-pytest-cov' 'python-pytest-pylint')
source=("$_name-$pkgver.tar.gz::https://github.com/irgeek/StrEnum/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d242148c576b4ebb5da72716fcb2019d1127793fb8a66a7fe1ccd114de057a6e')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_name-$pkgver"
  pytest
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
