# Maintainer: Austin Keller <austin474@gmail.com>

pkgname=python-jep
pkgver=4.0.3
pkgrel=1
pkgdesc="Java Embedded Python - Embeds CPython in Java through JNI"
arch=('any')
url="https://github.com/ninia/jep"
license=('ZLIB')
depends=('python-setuptools' 'python-numpy' 'java-environment')
makedepends=('python-setuptools')
provides=('python-jep')
conflicts=('python-jep')
source=(https://files.pythonhosted.org/packages/03/b2/c8b4fe4ec63005701d990a1e07d6e9e8b148dd183ebbcfd38f1001fd382a/jep-$pkgver.tar.gz)
sha256sums=('af903b0436d24824cbb364e9dc49d5de4bf98f4e19899755efcbb1d2151406e4')

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
