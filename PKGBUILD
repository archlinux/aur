# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: graysky <graysky AT archlinux DOT us>

pkgname=ssh-audit
pkgver=2.5.0
pkgrel=2
pkgdesc="SSH server and client configuration auditing"
arch=('any')
url="https://github.com/jtesta/ssh-audit"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('902c29c3eb6dc1ac894d8a75a28f74a43a2e172e513db97d70358d7e6737115e5308fef33541baf0f272a2dce4bb29355eb8809274cfffa64c16a02cb19ce75b')

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

check() {
  cd "$pkgname-$pkgver"
  PYTHONPATH="$(pwd)/src:$PYTHONPATH" pytest
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" --skip-build
  install -Dm644 -t "$pkgdir"/usr/share/man/man1 ssh-audit.1
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}
