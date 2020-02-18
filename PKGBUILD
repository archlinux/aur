# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Chris Severance aur.severach AatT spamgourmet.com
# Contributor: Chris Fordham <chris [at] fordham-nagy [dot] id [dot] au> aka flaccid
# Package Source: https://github.com/flaccid/archlinux-packages/blob/master/python-jmespath/PKGBUILD

pkgname=python2-jmespath
pkgver=0.9.4
pkgrel=3
pkgdesc='A query language for JSON'
arch=('any')
url="https://github.com/jmespath/jmespath"
license=('Apache')
depends=('python2')
makedepends=('python2-setuptools')
checkdepends=('python2-nose' 'python2-py')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jmespath/jmespath.py/archive/$pkgver.tar.gz")
sha512sums=('38b8d27dbd13d5ab056e115f4e8048fd54d649955dfcb2c296fe14dc684cd729351618c06c5b9a4b4d27798cfec6c2b7b340f498e961475e6fb3c9640b4e51ae')

build() {
  cd "$srcdir"/jmespath.py-$pkgver
  python2 setup.py build
}

check() {
  cd "$srcdir"/jmespath.py-$pkgver
  LC_CTYPE=en_US.utf8 nosetests2
}

package() {
  cd jmespath.py-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1

  mv "$pkgdir"/usr/bin/jp{,2}.py
}
