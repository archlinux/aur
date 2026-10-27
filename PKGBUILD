# Maintainer: Christian Pfeiffer <cpfeiffer+aur at rev-crew dot info>
# shellcheck shell=bash
# shellcheck disable=SC2034,SC2154

pkgname=crossplane-gixy
_projectname=crossplane
pkgver=0.5.16
pkgrel=5
pkgdesc="Reliable and fast NGINX configuration file parser"
arch=('any')
url="https://github.com/dvershinin/crossplane"
license=('Apache-2.0')
depends=('python')
optdepends=('python-simplejson: faster JSON encoding/decoding')
makedepends=('python-build' 'python-installer' 'python-setuptools')
checkdepends=('python-pytest')
provides=('crossplane')
conflicts=('crossplane')
options=('!debug')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/dvershinin/$_projectname/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('3a6dd3363ba720a8bc2462706993980ab71eae8c04a0bfd573a23440d5adbb1f6313c9ca62dfa814691b3ea49ea9793c9f1d9183f935286b02320422b982d0a0')
b2sums=('b43e71a5511f1e0bdbae381c8dfe3f6e2a12327128f0ea0659a7fada3d726c3a3565e46e5ff94ed2598b2c4b0225956acd0d65dfcb0260c28326d91634600e6c')

build() {
  cd "$srcdir/$_projectname-$pkgver" || exit
  python -m build --wheel --no-isolation
}

check() {
  cd "$srcdir/$_projectname-$pkgver" || exit
  python -m pytest
}

package() {
  cd "$srcdir/$_projectname-$pkgver" || exit
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 AUTHORS.rst README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 LICENSE NOTICE -t "$pkgdir/usr/share/licenses/$pkgname"
}
