# Maintainer: Sýlvan Heuser <sylvan.heuser@gmx.net>
pkgname=steck
_name=${pkgname#python-}
pkgver=0.7.0
pkgrel=1
pkgdesc="A command line client for the pinnwand pastebin"
arch=(any)
url="https://supakeen.com/project/steck"
license=('MIT')
depends=(
  'python'
  'python-appdirs'
  'python-click'
  'python-magic'
  'python-requests'
  'python-termcolor'
  'python-toml'
)
makedepends=(
  'python-setuptools'
)
options=(!emptydirs)
source=(
  "https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
)
sha256sums=('41c3d7e9f11fa752884c99440494b7b13e5921085707ffff4f93f1158f2074a8')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  export PYTHONHASHSEED=0
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
