# Maintainer: Andrej Radović <r.andrej@gmail.com>

pkgname=python-kinjector
_name=${pkgname#python-}
pkgver=0.0.6
pkgrel=1
pkgdesc="Inject/eject JSON/YAML data to/from KiCad Board files."
url="https://github.com/xesscorp/kinjector"
arch=(any)
license=('MIT')
depends=(
  'python'
  'python-pyaml'
)
makedepends=('python-setuptools')
source=(
  https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz
)
provides=("$pkgname")
md5sums=('92c3180d2b3af3ba4fde8989816777a6')

build() {
  cd "$srcdir/${_name}-${pkgver}/"
  python setup.py build
}

package() {
  cd "$srcdir/${_name}-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -D "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
