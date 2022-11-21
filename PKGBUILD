# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-munch
pkgver=2.5.0
pkgrel=6
pkgdesc="A dot-accessible dictionary (a la JavaScript objects)"
url="https://github.com/Infinidat/munch"
license=('MIT')
arch=('any')
depends=('python38-six')
makedepends=('python38-setuptools' 'python38-pbr' 'git')
checkdepends=('python38-pytest' 'python38-yaml')
source=(https://pypi.io/packages/source/m/munch/munch-${pkgver}.tar.gz)
sha512sums=('7eca31111f40782a19b49535322bc56d723022d52b0842c4beff512f32fa415a6c75851eb84950358cb6a11693095cafe56364028e48385b11135de414edca21')

build() {
  cd "$srcdir"/munch-$pkgver
  export PYTHONPATH=$PWD
  python3.8 setup.py build
}

check() {
  cd "$srcdir"/munch-$pkgver
  pytest
}

package() {
  cd munch-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}
