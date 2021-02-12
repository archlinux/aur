# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>

# Based on python-jsonpatch in [community]

_urlname=python-json-patch
pkgname=python2-jsonpatch
pkgver=1.28
pkgrel=1
pkgdesc='An implementation of the JSON Patch format'
arch=('any')
url="https://github.com/stefankoegl/$_urlname"
license=('BSD')
depends=('python2-jsonpointer')
makedepends=('python2-setuptools' 'python2-pypandoc')
checkdepends=('python2-coverage')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('2884cb95307cb607c8cd80e688491b4449f953e43e5b232d4d57d7249c590652ecae0856806ade6bf2807a04180e992fd2cdf61590ac058d573d653382bf7a28')

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
