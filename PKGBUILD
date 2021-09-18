# Maintainer: Andrej Radović <r.andrej@gmail.com>

pkgname=python-kinjector
_name=${pkgname#python-}
pkgver=1.0.0
pkgrel=1
pkgdesc="Inject/eject JSON/YAML data to/from KiCad Board files."
url="https://github.com/devbisme/kinjector"
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
md5sums=('00d391ee8c78a486a88aecc49003f832')

build() {
  cd "$srcdir/${_name}-${pkgver}/"
  python setup.py build
}

package() {
  cd "$srcdir/${_name}-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -D "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
