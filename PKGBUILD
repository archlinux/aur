# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=python-strenum
_name=StrEnum
pkgver=0.4.7
pkgrel=1
pkgdesc="A Python Enum that inherits from str."
arch=('any')
url="https://github.com/irgeek/StrEnum"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz"
        "https://raw.githubusercontent.com/irgeek/StrEnum/v$pkgver/LICENSE")
sha256sums=('6019e9cc1738af6a236c022b82184372178ecadf12438f11f5b680a02a462377'
            'bcd733d0a46522162b95dbab61f7cdc1c3e36861dfa127d68a4435240d36ad36')

prepare() {
  cd "$_name-$pkgver"

  # Does not require pytest-runner to build
  sed -i '/setup_requires/d' ./setup.py
}

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm644 $srcdir/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
