# Based on yapf 0.27.0 PKGBUILD
# Maintainer: Viliam Pucik <viliam dot pucik at pm dot me>

name=yapf
pkgname=python2-$name
pkgver=0.28.0
pkgrel=1
pkgdesc="Python style guide checker"
arch=('any')
url="https://github.com/google/yapf"
license=('Apache')
depends=('python2-setuptools')
checkdepends=('python2-nose')
source=("$name-$pkgver.tar.gz::https://github.com/google/$name/archive/v$pkgver.tar.gz")
sha512sums=('be9ed5278d085797aba4a582a37295716c76fd10a4cea4bb5090794dd53eba6d1340d8ba7508e33a146f189a863578c95b0a651bbfd90b0390076028e03ad9bf')

build() {
  cd $name-$pkgver
  python2 setup.py build
}

check() {
  cd $name-$pkgver
  nosetests2 || warning "https://github.com/google/yapf/issues/586"
}

package() {
  cd $name-$pkgver
  python2 setup.py install -O1 --root="$pkgdir"
  mv "$pkgdir"/usr/bin/yapf{,2}
}
