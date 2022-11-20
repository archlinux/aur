# Maintainer : Felix Yan <felixonmars@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=python38-pyopenssl
pkgver=22.1.0
pkgrel=1
arch=('any')
pkgdesc="Python3 wrapper module around the OpenSSL library"
url='https://github.com/pyca/pyopenssl'
license=('Apache')
depends=('python38-cryptography')
makedepends=('python38-setuptools')
checkdepends=('python38-pytest' 'python38-pretend' 'python38-flaky')
source=(https://github.com/pyca/pyopenssl/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha512sums=('724a685042f890eccac7b97caada0b06297320b7352346ff6a714594e78e53fccb8119b606ffac113e3eb7d96402765892bb69a705176d448bd61a7426ac24ae')

prepare() {
  export LC_CTYPE=en_US.UTF-8
}

build() {
  cd pyopenssl-$pkgver
  python3.8 setup.py build
}

check() {
  cd pyopenssl-$pkgver
  PYTHONPATH="$PWD"/build/lib pytest
}

package() {
  cd pyopenssl-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim: ts=2 sw=2 et:
