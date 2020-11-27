# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>

# Based on python-jsonpatch in [community]

_urlname=python-json-patch
pkgname=python2-jsonpatch
pkgver=1.27
pkgrel=1
pkgdesc='An implementation of the JSON Patch format'
arch=('any')
url="https://github.com/stefankoegl/$_urlname"
license=('BSD')
depends=('python2-jsonpointer')
makedepends=('python2-setuptools' 'python2-pypandoc')
checkdepends=('python2-coverage')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('297ca02d114e6b199bd516f69dca147fbe309f0a1b031046859271720645322607236f97b489c242575f7e1ad3cab0c68b1b7f11894c5af82be24013e376c0a4')

prepare(){
  find $_urlname-$pkgver -name \*.py -exec sed -i '1s/python$/&2/' {} +
}

build() {
  cd $_urlname-$pkgver

  python2 setup.py build
}

check() {
  cd $_urlname-$pkgver

  coverage2 run --source=jsonpatch tests.py
}

package() {
  cd $_urlname-$pkgver

  install -Dm644 COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-build
  for _bin in "$pkgdir"/usr/bin/*; do
    mv "$_bin"{,2}
  done
}
