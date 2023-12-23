# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=widlparser
pkgname="python-$_pkgname"
pkgver=1.1.4
pkgrel=1
pkgdesc="WebIDL Parser"
arch=('any')
url="https://pypi.org/project/$_pkgname"
license=('MIT')
depends=('python' 'python-typing-extensions')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools-scm')
source=("$pkgname::git+https://gitlab.linss.com/open-source/python/widlparser.git#tag=v$pkgver"
        LICENSE)
sha256sums=('SKIP'
            'f348501d1ffcefb090a49e4ec6911786e7913347f50f0924d5256497213a2493')
b2sums=('SKIP'
        '9869a2d862cc7ea22788323384983b8afe64f0015bfae28181d60b0601e2e4c67e74774a4e318842873eef418eb887bfa0f58ef6cca59278f52d95433a2c79a4')

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" \
    "$srcdir/LICENSE"
}
