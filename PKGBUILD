# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
pkgname=radian
pkgver=0.8.0
pkgrel=1
pkgdesc="A 21st century R console"
url="https://github.com/randy3k/radian"
arch=('any')
license=('MIT')
depends=('python-pygments'
         'python-prompt_toolkit<3.1'
         'python-rchitect>=0.6.0' 'python-rchitect<0.7.0')
optdepends=('python-jedi: Python console completion'
            'python-coverage: coverage instrumentation')
makedepends=(python-build python-installer python-wheel python-setuptools)
source=($pkgname-$pkgver.tar.gz::https://github.com/randy3k/radian/archive/v$pkgver.tar.gz)
sha256sums=('ad92b7601cfd955ab1304bf40c76ccae22a88148305253a94d9ef71dbb5ae959')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check_disabled() { # may fail because of R profile
  cd "$srcdir/$pkgname-$pkgver"
  pytest
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
