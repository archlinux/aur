# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=widlparser
pkgname="python-$_pkgname"
pkgver=1.4.0
pkgrel=1
pkgdesc="WebIDL Parser"
arch=('any')
url="https://pypi.org/project/$_pkgname"
license=('MIT')
depends=('python' 'python-typing_extensions')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools-scm')
source=("$pkgname-$pkgver.tar.gz::https://gitlab.linss.com/open-source/python/widlparser/-/archive/v$pkgver/widlparser-v$pkgver.tar.gz"
        LICENSE)
sha256sums=('92054b3f8b36be00501b691c2a556be6ff78fd311a722339b1d456df785e3c60'
            'f348501d1ffcefb090a49e4ec6911786e7913347f50f0924d5256497213a2493')
b2sums=('01c2846020a8f6a954d6b12da2df26e996d6d185cb503f209e250622d0cf886fbd192dfef22a38d5f1b3678c24523b2dbad5b9e84482bfb80b178a15517da0df'
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
