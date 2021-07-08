# Maintainer: Austin Keller <austin474@gmail.com>

pkgname=python-jep
pkgver=3.9.1
pkgrel=1
pkgdesc="Java Embedded Python - Embeds CPython in Java through JNI"
arch=('any')
url="https://github.com/ninia/jep"
license=('ZLIB')
depends=('python-setuptools' 'python-numpy' 'java-runtime')
makedepends=('python-setuptools')
source=(https://files.pythonhosted.org/packages/99/e6/c2e22cfe92762a7add980a40d0d784a0365d53ea656d47610a40d069c086/jep-$pkgver.tar.gz)
sha256sums=('7ccd25a92a19a391504e766940190bdcd4d6b3a8488ca4a3adc8eb8cd581c0cb')

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
