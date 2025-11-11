# Maintainer: killab33z <killab33z @ protonmail-dot-ch>
pkgname=python-defusedcsv
_pkgname=defusedcsv
pkgver=3.0.0
pkgrel=1
pkgdesc='Drop-in replacement for Python CSV library that tries to mitigate CSV injection attacks'
arch=('any')
url='https://github.com/raphaelm/defusedcsv'
license=('Apache-2.0')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('3544fd337669df85befae6fbb810bb609db6632fab2aff632b88b638d1a6fb1762e1f9d93c9401cbe74154be4ad1735dc8ce592b618050bfae46d93ec49908dc')

# https://wiki.archlinux.org/title/Python_package_guidelines#Standards_based_(PEP_517)
build() {
  cd "$_pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dm644 "$srcdir/$_pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

