# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=python-jaconv
pkgver=0.3.4
pkgrel=3
pkgdesc="Pure-Python Japanese character interconverter for Hiragana, Katakana, Hankaku and Zenkaku"
arch=('any')
url="https://github.com/ikegami-yukino/jaconv"
license=('MIT')
depends=(python)
makedepends=(git python-setuptools)
source=("git+$url.git#tag=v$pkgver")
b2sums=('4b0ef882cdffe9eee2d64474ac475863949c3390e9832b34be9c3c40cb8acf5a734a0d2f14e480e0cd51a91d92b6de4802095dabcdc98f78088762412e68be17')

build() {
  cd jaconv
  python setup.py build
}

package() {
  cd jaconv
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  # remove unnecessary files
  rm "$pkgdir"/usr/{CHANGES,README}.rst

  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README{,_JP}.rst
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
