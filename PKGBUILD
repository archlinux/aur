# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-mocket
pkgver=3.9.36
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
sha512sums=('80c4fc41c29aa15fd3c380919b04afe78450306b0af808883e120ee06b2cd330d79c3d46c9de1eec6eb4c7e8554de5deaaf750680c9ef1a8b26083156eaa4b28')

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
