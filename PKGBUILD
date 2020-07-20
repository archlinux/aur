# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=stakkr
pkgver=4.2
pkgrel=1
pkgdesc='A recompose tool that uses docker compose to easily create / maintain a stack of services. Via a configuration file you can setup the required services and let the app link and start everything for you'
arch=('any')
url='https://github.com/stakkr-org/stakkr'
license=('Apache')
conflicts=('stakkr-git')
depends=('docker-compose'
         'python-click-plugins'
         'python-clint'
         'python-yaml'
         'python-anyconfig'
         'python-gitpython')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/stakkr-org/stakkr/archive/v${pkgver}.tar.gz")
sha256sums=('2c3c75a476a533f8d9eab9901cedb1f1c3dc51fe9b3af2ce7ec410342bb2319d')

prepare() {
  cd "${pkgname}-${pkgver}"
  for i in 35 36 37 38 39 40; do
    sed -i "${i}s|==|>=|" setup.py
  done
}

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
# vim:set ts=2 sw=2 et: