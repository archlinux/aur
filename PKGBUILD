# Maintainer: killab33z <killab33z @ protonmail-dot-com>
pkgname=python-alive-progress
_pkgname=alive-progress
pkgver=3.2.0
pkgrel=1
pkgdesc='A new kind of Progress Bar, with real-time throughput, ETA, and very cool animations.'
arch=('any')
url='https://github.com/rsalmei/alive-progress'
license=('MIT')
depends=('python' 'python-about-time' 'python-grapheme')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('b7b3840e4e282bb95f85cf054abc0eff49364872ea9655585941b5e69e555ea516b39fbbe737c66ba65246ef5f1e3cfb1da3191500cb22540ccd66af67fb0e8f')

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

