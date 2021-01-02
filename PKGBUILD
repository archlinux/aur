# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-mocket
pkgver=3.9.35
pkgrel=1
pkgdesc="Socket Mock Framework - for all kinds of socket animals, web-clients included - with gevent/asyncio/SSL support"
url="https://github.com/mindflayer/python-mocket"
license=('BSD')
arch=('any')
depends=('python-decorator' 'python-http-parser' 'python-magic' 'python-urllib3')
makedepends=('python-pipenv-to-requirements' 'python-pytest-cov' 'python-setuptools')
checkdepends=('pifpaf' 'python-aiohttp' 'python-gevent' 'python-mock' 'python-pook' 'python-redis'
              'python-sure' 'python-xxhash' 'redis')
source=("https://github.com/mindflayer/python-mocket/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('b38b808fdc2cbbe740cd0da5bf66e522fc4de6374ddee92f702326df25162139353e30e512b2a25fd26a3134bb342a037b442199c1534257554c9a0ded44ee73')

prepare() {
  cd python-mocket-$pkgver
  pipenv_to_requirements

  sed -i 's/python-magic/file_magic/' requirements.txt
}

build() {
  cd python-mocket-$pkgver
  python setup.py build
}

check() {
  cd python-mocket-$pkgver
  pifpaf run redis pytest
}

package() {
  cd python-mocket-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
