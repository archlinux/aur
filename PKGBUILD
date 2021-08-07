# Maintainer: zjuyk <ownbyzjuyk@gmail.com>
# Maintainer: Nick Cao <nickcao@nichi.co>

pkgname=index-generator
pkgver=0.3.0
pkgrel=1
pkgdesc='Yet another python index generator'
arch=('any')
url='https://github.com/index-generator-project/index-generator'
license=('MIT')
depends=('python' 'python-jinja')
makedepends=('python-setuptools' 'python-pip')
checkdepends=('python-pytest')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/index-generator-project/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('0bbe3be9527f226da958326002dc83485ce6823c2d87d996aba13a8f9282a7b341090616a9e008eabe2c8c2a11bb81e00771fa9f400358ec983831b3cda9117b')

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

check(){
  cd "${pkgname}-${pkgver}"
  python setup.py pytest
}

package() {
  cd "${pkgname}-${pkgver}"
  export PYTHONHASHSEED=0
  python setup.py install --skip-build --optimize=1 --root="${pkgdir}"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

