# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
pkgname=python2-pbr
_name="${pkgname#python2-}"
pkgver=6.0.0
pkgrel=1
pkgdesc='Python Build Reasonableness (for Python 2)'
arch=('any')
_pypi='https://pypi.python.org'
url="$_pypi/pypi/$_name"
license=('Apache')
depends=('python2-setuptools')
optdepends=(
  'python2-importlib-metadata: Collect semantic version avoiding pkg_resources'
)
source=("$_pypi/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('d1377122a5a00e2f940ee482999518efe16d745d423a670c27773dfbc3c9a7d9')

build() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
  mv "$pkgdir/usr/bin/pbr"{,2}
}
