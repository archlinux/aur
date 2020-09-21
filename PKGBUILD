# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>

pkgname=check-manifest
pkgver=0.43
pkgrel=1
pkgdesc="Check MANIFEST.in in a Python package for completeness"
arch=('any')
url="https://github.com/mgedmin/check-manifest"
license=('MIT')
depends=('python-pep517' 'python-setuptools' 'python-toml')
checkdepends=('python-mock' 'python-pytest')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('1f787b81e5a2a3c69a9e4a2a44788ab672efbac43d7d5bd0b9e8fe49a0929e55')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m pytest tests.py
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --prefix=/usr --skip-build --optimize=1
  install -Dm644 LICENSE.rst -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et:
