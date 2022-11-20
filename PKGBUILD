# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Karol 'Kenji Takahashi' Woźniak <kenji.sx>
# Contributor: Pierre Gueth <pierre.gueth@gmail.com>

pkgname=python38-redis
pkgver=4.3.4
pkgrel=1
pkgdesc='The Python interface to the Redis key-value store'
arch=('any')
url="https://github.com/redis/redis-py"
license=('MIT')
depends=('python38-deprecated')
makedepends=('python38-setuptools')
checkdepends=('python38-pytest' 'pifpaf' 'redis')
source=("https://pypi.io/packages/source/r/redis/redis-$pkgver.tar.gz")
sha512sums=('606a09ff87870be9eda84b4ac074bf35b06882d9a9da448a9c17a54cb5e0a295f28d3f765ee88e92b1ad6d08532a2a6799acc4a1ea30e7cec9e652214999e98a')

build() {
  cd "$srcdir"/redis-$pkgver
  python3.8 setup.py build
}

check() {
  cd "$srcdir"/redis-$pkgver
  pifpaf run redis py.test || echo "https://github.com/andymccurdy/redis-py/issues/1073"
}

package() {
  cd redis-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
