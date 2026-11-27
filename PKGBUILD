# Maintainer: Antonio Rodriguez <kontakt@antoniorodriguez.no>

pkgname=cronboard
pkgver=1.4.0
pkgrel=1
pkgdesc="A terminal-based dashboard for managing cron jobs"
arch=('any')
url="https://github.com/antoniorodr/cronboard"
license=('Apache 2.0')

depends=(
  'python>=3.13'
  'python-bcrypt'
  'python-cron-descriptor'
  'python-croniter'
  'python-paramiko'
  'python-python-crontab'
  'python-textual'
  'python-textual-autocomplete'
  'python-tomlkit'
  'cronie'
)

makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
  'python-pytest'
  'python-textual-dev'
)

source=("$pkgname-$pkgver.tar.gz::https://github.com/antoniorodr/cronboard/releases/download/v$pkgver/cronboard-$pkgver.tar.gz")
sha256sums=('015ba6590eca22451c83a8ff825d0876a2c4adb9d2d3587a65a81f48fd91a1b2')

build() {
  cd "$pkgname-$pkgver" || exit 1
  msg2 "Building package..."
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver" || exit 1
  msg2 "Installing package..."
  python -m installer --destdir="$pkgdir" dist/*.whl
}
