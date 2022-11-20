# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python38-fields
pkgname=python38-fields
pkgver=5.0.0
pkgrel=13
arch=('any')
pkgdesc='A totally different take on container boilerplate'
url='https://github.com/ionelmc/python-fields'
license=('BSD')
depends=('python38')
makedepends=('python38-setuptools')
checkdepends=('python38-pytest' 'python38-attrs' 'python38-characteristic')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/ionelmc/python-fields/archive/v$pkgver.tar.gz")
        #python310.patch)
sha512sums=('feaba23b98271936d6dae20b1001978483c0fe89ccf217637fac536ae5814c2c02bac1c3ddc2a86dc0d2419a3b3658871018c0ea4b7905e1c2649aa905b8e5a3'
            '72876eba870204558d4f1a8216be5e2240406e669929605919b1adeb03a9cf230909d7658c26197189e61bd4005bcb00665c652bff6f14a97cdff881e6b45f80')

prepare() {
  cd $pkgname-$pkgver
  #patch -Np1 -i ../python310.patch
  sed -i 's/\[pytest\]/[tool:pytest]/;s/--benchmark-disable//' setup.cfg
}

build() {
  cd "$srcdir"/python38-fields-$pkgver
  python3.8 setup.py build
}

check() {
  cd "$srcdir"/python38-fields-$pkgver
  python3.8 -m pytest --deselect tests/test_perf.py
}

package_python38-fields() {
  cd python38-fields-$pkgver
  python3.8 setup.py install --root "$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
