# Contributor: katt <magunasu.b97@gmail.com>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>

pkgname=check-manifest
pkgver=0.50
pkgrel=1
pkgdesc='Check MANIFEST.in in a Python package for completeness'
arch=(any)
url='https://github.com/mgedmin/check-manifest'
license=(MIT)
depends=('python>=3.8' python-build python-setuptools python-toml)
# Require python 3.8+ to get get rid of python-mock
# https://github.com/mgedmin/check-manifest/pull/158
makedepends=(python-installer python-wheel)
checkdepends=(git python-pytest subversion)
source=($pkgname-$pkgver.tar.gz::"$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('66d6a3523e7732d9e671bf4b2f9061787ddd354d8ee0717abe09f0e99b905e00')

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $pkgname-$pkgver
  python -m pytest tests.py
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.rst -t "$pkgdir"/usr/share/licenses/$pkgname
}

# vim:set ts=2 sw=2 et:
