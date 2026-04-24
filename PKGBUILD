# Maintainer: Antonio Rodriguez <kontakt@antoniorodriguez.no>

pkgname=cronboard
pkgver=0.5.2
pkgrel=1
pkgdesc="A terminal-based dashboard for managing cron jobs"
arch=('any')
url="https://github.com/antoniorodr/cronboard"
license=('MIT')

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
sha256sums=('0ce4b902e9f4e4d00518fc76a4f4587d5eaaac8e92ea5b982a380eb2dc496ff5')

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
