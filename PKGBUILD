# Maintainer: PumpkinCheshire <$(base64 --decode <<<'c29sbHlvbnpvdUBnbWFpbC5jb20=')>

pkgname='python-mercantile'
_name=mercantile
pkgver=1.2.1
pkgrel=1
pkgdesc='Spherical mercator tile and coordinate utilities'
arch=('any')
url='https://github.com/mapbox/mercantile'
license=('MIT')
makedepends=('python-setuptools')
depends=('python-click')
optdepends=('check-manifest: dev tools'
  'python-coveralls: test tools'
  'python-hypothesis: test tools'
  'python-pytest-cov: test tools'
  'python-pydocstyle: doc style control')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz"
  'https://raw.githubusercontent.com/mapbox/mercantile/master/LICENSE.txt')
sha256sums=('fa3c6db15daffd58454ac198b31887519a19caccee3f9d63d17ae7ff61b3b56b'
  'b62b62ad938b5e163b58c137c89f8241b318f203a90fcc0920e9c2bca8eeb555')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 "$srcdir/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
