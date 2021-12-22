# Maintainer: Austin Keller <austin474@gmail.com>

pkgname=python-jep
pkgver=4.0.0
pkgrel=1
pkgdesc="Java Embedded Python - Embeds CPython in Java through JNI"
arch=('any')
url="https://github.com/ninia/jep"
license=('ZLIB')
depends=('python-setuptools' 'python-numpy' 'java-environment')
makedepends=('python-setuptools')
provides=('python-jep')
conflicts=('python-jep')
source=(https://files.pythonhosted.org/packages/19/6e/745f9805f5cec38e03e7fed70b8c66d4c4ec3997cd7de824d54df1dfb597/jep-$pkgver.tar.gz)
sha256sums=('fb27b1e95c58d1080dabbbc9eba9e99e69e4295f67df017b70df20f340c150bb')

build() {
  export JAVA_HOME=${JAVA_HOME:-/usr/lib/jvm/default}
  cd jep-$pkgver
  python3 setup.py build
}

check() {
  cd jep-$pkgver
  python3 setup.py test
}

package() {
  cd jep-$pkgver
  python3 setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
