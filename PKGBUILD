# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

_name=jaconv
pkgname=python-$_name
pkgver=0.3.4
pkgrel=1
pkgdesc="Pure-Python Japanese character interconverter for Hiragana, Katakana, Hankaku and Zenkaku"
arch=('any')
url="https://github.com/ikegami-yukino/jaconv"
license=('MIT')
depends=(python)
makedepends=(python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('9e7c55f3f0b0e2dbad62f6c9fa0c30fc6fffdbb78297955509d90856b3a31d6d')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  # remove unnecessary files
  rm "$pkgdir"/usr/{CHANGES,README}.rst

  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README{,_JP}.rst
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
