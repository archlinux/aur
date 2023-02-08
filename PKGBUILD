# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>

pkgname=check-manifest
pkgver=0.49
pkgrel=2
pkgdesc='Check MANIFEST.in in a Python package for completeness'
arch=(any)
url='https://github.com/mgedmin/check-manifest'
license=(MIT)
depends=(python-build python-setuptools python-toml)
makedepends=(python-installer python-wheel)
checkdepends=(git python-mock python-pytest subversion)
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('64a640445542cf226919657c7b78d02d9c1ca5b1c25d7e66e0e1ff325060f416')

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
