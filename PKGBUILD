# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-pip-run
pkgver=8.8.1
pkgrel=1
pkgdesc="Install packages and run Python 3.8 with them"
url="https://github.com/jaraco/pip-run"
license=('MIT')
arch=('any')
depends=('python38-autocommand' 'python38-packaging' 'python38-path' 'python38-pip')
makedepends=('python38-build' 'python38-installer' 'python38-setuptools-scm' 'python38-wheel')
checkdepends=('python38-pytest' 'jupyter-nbformat' 'python38-pytest-enabler')
source=("https://github.com/jaraco/pip-run/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('ae964ca96f0be33fdb33974061e75486c443fda5edf0cf43247e8bd293d9a6a87d2cd421100578ed5179f13c9f46ff10ec730e0b403982da7e8aac22651268ea')

export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver

build() {
  cd pip-run-$pkgver
  python3.8 -m build -wn
}

check() {
  cd pip-run-$pkgver
  python3.8 -m pytest
}

package() {
  cd pip-run-$pkgver
  python3.8 -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
