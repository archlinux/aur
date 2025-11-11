# Maintainer: killab33z <killab33z @ protonmail-dot-com>
pkgname=python-alive-progress
_pkgname=alive-progress
pkgver=3.3.0
pkgrel=1
pkgdesc='A new kind of Progress Bar, with real-time throughput, ETA, and very cool animations.'
arch=('any')
url='https://github.com/rsalmei/alive-progress'
license=('MIT')
depends=('python' 'python-about-time' 'python-grapheme')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('d957e334fa44e2ea1703311c82e6479c7a8d0de657106d29322d9eb33f4990b8095b2896b41d10f0c759b9dd61abed9c274249cc959d48890fe22afc0e976c3c')

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

