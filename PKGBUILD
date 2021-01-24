# Maintainer: zjuyk <ownbyzjuyk@gmail.com>
# Maintainer: Nick Cao <nickcao@nichi.co>

pkgname=index-generator
pkgver=0.2.9
pkgrel=1
pkgdesc='Yet another python index generator'
arch=('any')
url='https://github.com/index-generator-project/index-generator'
license=('MIT')
depends=('python' 'python-jinja')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
_name=${pkgname#python-}
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('e2a0a27ee5c10e59d8bd1cb606e99afb365c99dc51e659e39d591f036564b58018857699a7b65c53d066bcf48ce717cfab00b542222b9232aed18fd869a3fb7c')

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

