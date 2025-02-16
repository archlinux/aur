# Maintainer: Moonlit Tune <moonlit underscore tune at protonmail dot com>

pkgname=python-lxmf
_name='lxmf'
pkgver=0.6.2
pkgrel=1
pkgdesc="Lightweight Extensible Message Format for Reticulum"
arch=('any')
depends=('python-rns')
makedepends=('python-setuptools')
url="https://github.com/markqvist/lxmf"
license=('MIT')
source=($pkgname-$pkgver::$url/archive/refs/tags/$pkgver.tar.gz)
sha256sums=('93520bbc05fab16ad35a440c4c1b5fc834e64fa43231dcbaa07648b5fce78409')

build() {
  cd "$srcdir/LXMF-$pkgver"

  python setup.py build
}

package() {
  cd "$srcdir/LXMF-$pkgver"

  install -Dm 644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  for f in ./docs/*; do
      install -Dm 644 "$f" "$pkgdir/usr/share/doc/$pkgname/docs/$(basename $f)"
  done

  python setup.py install --root="$pkgdir" --optimize=1
}
