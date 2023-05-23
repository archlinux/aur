# Maintainer: Tommy Jerry Mairo <tjm@member.fsf.org>

_name=jep
pkgname=python-"$_name"
pkgver=4.1.1
pkgrel=1
pkgdesc="Java Embedded Python - Embeds CPython in Java through JNI"
arch=('any')
url="https://github.com/ninia/jep"
license=('ZLIB')
depends=('python-numpy>=1.7' 'java-environment' 'python>=3.5')
makedepends=('python-setuptools')
provides=('python-jep')
conflicts=('python-jep')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ninia/$_name/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')


build() {
  export JAVA_HOME=${JAVA_HOME:-/usr/lib/jvm/default}
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
