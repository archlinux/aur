# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: tsipizic

pkgname=python-yeelight
pkgver=0.7.14
pkgrel=1
_commit=2c7b5024
pkgdesc='Python library for controlling YeeLight RGB bulbs'
arch=('any')
url='https://gitlab.com/stavros/python-yeelight'
license=('BSD')
depends=('python-ifaddr' 'python')
makedepends=(
  'git'
  'python-flit-core'
  'python-build'
  'python-installer'
#  'python-wheel'
#  'python-sphinx'
#  'python-sphinx_rtd_theme'
)
changelog=CHANGELOG.md
source=("$pkgname::git+$url#commit=$_commit?signed"
        "https://gitlab.com/stavros/python-yeelight/-/commit/654f4f34e0246e65d8db02a107e2ab706de4806d.patch")
sha256sums=('42ffd8cbe88822d624cdb0df1f0edb4f06c43839316e22de29f02eea1aff2cc8'
            '55388fa4940cfeaa4b45e2b76fdbe85a9148a78eb0a964db2ee7a965d899250b')
validpgpkeys=('3D2E921F15667F0FD5B3017E26EA345ECD4C2A63')

build() {
  cd "$pkgname"
  patch -p1 -i ../654f4f34e0246e65d8db02a107e2ab706de4806d.patch
  PYTHONPATH=./ python -m build --wheel --skip-dependency-check --no-isolation
  cd docs
#  PYTHONPATH=../ make man
}

package() {
  export PTYHONHASHSEED=0
  cd "$pkgname"
  python -m installer --destdir="$pkgdir/" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
#  install -Dm644 docs/build/man/yeelight.1 -t "$pkgdir/usr/share/man/man1/"
}

# vim: ts=2 sw=2 et:
