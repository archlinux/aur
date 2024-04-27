# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=widlparser
pkgname="python-$_pkgname"
pkgver=1.1.5
pkgrel=1
pkgdesc="WebIDL Parser"
arch=('any')
url="https://pypi.org/project/$_pkgname"
license=('MIT')
depends=('python' 'python-typing_extensions')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools-scm')
source=("$pkgname-$pkgver.tar.gz::https://gitlab.linss.com/open-source/python/widlparser/-/archive/v$pkgver/widlparser-v$pkgver.tar.gz"
        LICENSE)
sha256sums=('d2d228d2bbbc3dd3fac2a6c5e6a6240c9a8450d5d0f9d1b68368d7cffcb64251'
            'f348501d1ffcefb090a49e4ec6911786e7913347f50f0924d5256497213a2493')
b2sums=('0b3131654a6afaea15b2bfb5cef36135e62b28c8bb3714db7501c42bd93988c087e71bbf26b99f7996116803dd4fda9301592d35b183017ccadc54ba4494d202'
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
