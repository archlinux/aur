# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=widlparser
pkgname="python-$_pkgname"
pkgver=1.5.0
pkgrel=1
pkgdesc="WebIDL Parser"
arch=('any')
url="https://pypi.org/project/$_pkgname"
license=('MIT')
depends=('python' 'python-typing_extensions')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools-scm')
source=("$pkgname-$pkgver.tar.gz::https://gitlab.linss.com/open-source/python/widlparser/-/archive/v$pkgver/widlparser-v$pkgver.tar.gz"
        LICENSE)
sha256sums=('f8ac72baa9f2e420f65ce5236b4b9240425232a184693b273127556733b73096'
            'f348501d1ffcefb090a49e4ec6911786e7913347f50f0924d5256497213a2493')
b2sums=('892782cc3f2ea8ec1016522bcdc42203e61f05951570b014642a8f32a771fbc2dc588248fa987191bc10b9f974286bb54015d9fbcc4efc5e8194719a70b0ebc4'
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
