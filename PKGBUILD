# Maintainer: Your Name <youremail@domain.com>
pkgname=python-strenum
_name=StrEnum
pkgver=0.4.6
pkgrel=1
pkgdesc="A Python Enum that inherits from str."
arch=('any')
url="https://github.com/irgeek/StrEnum"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz"
        "https://raw.githubusercontent.com/irgeek/StrEnum/v$pkgver/LICENSE")
sha256sums=('fbcdba3aad17bb00bd28023ad24813314ed95662b2055ee8d07f8bff0486c726'
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
  export PYTHONHASHSEED=0
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm644 $srcdir/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
