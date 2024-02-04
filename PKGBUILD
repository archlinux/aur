# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
pkgname=python2-pbr
_name="${pkgname#python2-}"
pkgver=5.11.1
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
sha256sums=('aefc51675b0b533d56bb5fd1c8c6c0522fe31896679882e1c4c63d5e4a0fccb3')

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
