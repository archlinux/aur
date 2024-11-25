# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname=faustdoctor
pkgver=0.2.0
pkgrel=1
pkgdesc="A post-processor for FAUST giving more flexibility at source generation"
arch=(any)
url="https://github.com/SpotlightKid/faustdoctor"
license=(LicenseRef-BSL-1.0-with-template-exception)
depends=(
  faust
  python
  python-jinja
)
makedepends=(
  python-build
  python-hatch
  python-installer
  python-wheel
)
source=("https://github.com/SpotlightKid/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('308a068b645aed5a8c3faa66af53988f402a21b5f9ea052d72a0e5b176e59cf8c4bd8688cf3371600ad4cfb4920f48706b40fb0650f777fb4fd87406980549aa')

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE-EXCEPTION.md -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 README.md CHANGELOG.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
