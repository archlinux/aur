# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-mocket
pkgver=3.9.3
pkgrel=3
pkgdesc="Socket Mock Framework - for all kinds of socket animals, web-clients included - with gevent/asyncio/SSL support"
url="https://github.com/mindflayer/python-mocket"
license=('BSD')
arch=('any')
depends=('python-decorator' 'python-http-parser' 'python-magic' 'python-urllib3' 'python-six')
makedepends=('python-pipenv-to-requirements' 'python-pytest-cov' 'python-setuptools')
checkdepends=('pifpaf' 'python-aiohttp' 'python-gevent' 'python-mock' 'python-pook' 'python-redis'
              'python-sure' 'python-xxhash' 'redis')
source=("https://github.com/mindflayer/python-mocket/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('79d0bad6d0f23c0cd432eebbc7b374f4d6f23dab7b573b8777edc8e03d7edbc7ca144738ce453d53558ab18938ec0d760f81b72966e71dc57dd53b9f8974ed71')

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
