# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>
# Contributor: yochanamarqos

pkgname=python-cutie
_name=${pkgname#python-}
pkgver=0.2.2
pkgrel=1
pkgdesc="Command line User Tools for Input Easification"
arch=('any')
url="https://github.com/Kamik423/cutie"
license=('MIT')
depends=('python' 'python-colorama' 'python-readchar')
makedepends=('python-setuptools')
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz"
        "https://raw.githubusercontent.com/Kamik423/cutie/master/license.md"
        "https://raw.githubusercontent.com/Kamik423/cutie/master/readme.md")
sha256sums=('5e38711dedc2efec4f62290f30bc9ad4b489de33fe2d84efafb3611971bc4a91'
            'b9a6af81b2d9c1ee676c80ba084e15a8d4d81b108ec01e9464dd73aa5f6e55ae'
            '3d0c76981947963540d631ccd0e64da84a2d8ad36de7eb6b3b454a69ce0a558e')

prepare() {
  cd "$_name-$pkgver"

  # readme.md missing in PyPI tarball
  ln -s "$srcdir/readme.md" readme.md
}

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  export PYTHONHASHSEED=0
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm644 "$srcdir/license.md" -t "$pkgdir/usr/share/licenses/$pkgname"
}
# vim:set ts=2 sw=2 et:
