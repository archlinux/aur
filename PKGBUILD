# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=widlparser
pkgname="python-$_pkgname"
pkgver=1.2.0
pkgrel=1
pkgdesc="WebIDL Parser"
arch=('any')
url="https://pypi.org/project/$_pkgname"
license=('MIT')
depends=('python' 'python-typing_extensions')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools-scm')
source=("$pkgname-$pkgver.tar.gz::https://gitlab.linss.com/open-source/python/widlparser/-/archive/v$pkgver/widlparser-v$pkgver.tar.gz"
        LICENSE)
sha256sums=('64167d3d7bfd8ada12ad7f3e458c3c3b668b39074b35c6cf9fb60c64f729d218'
            'f348501d1ffcefb090a49e4ec6911786e7913347f50f0924d5256497213a2493')
b2sums=('787849244eee8dd191421109057472f2e766096207de7f86586203dd7abbc4573e81b20b5a469aa522e05f09aa045e505d50739e4272893bb76ee49630775ec8'
        '9869a2d862cc7ea22788323384983b8afe64f0015bfae28181d60b0601e2e4c67e74774a4e318842873eef418eb887bfa0f58ef6cca59278f52d95433a2c79a4')

build() {
  cd "widlparser-v$pkgver"

  SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver" \
    python -m build --wheel --no-isolation
}

package() {
  cd "widlparser-v$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" \
    "$srcdir/LICENSE"
}
