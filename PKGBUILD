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
sha512sums=('d63a13db2a30779359d54d49640d694eb6d0fbc1377428df7bf28b3fe5ad03aedd7947a736e2a0219c11d34645d813c77809d7052b39a8f3f4bde9db58b78213')

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

