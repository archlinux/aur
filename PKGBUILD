# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: graysky <graysky AT archlinux DOT us>

pkgname=ssh-audit
pkgver=2.4.0
pkgrel=2
pkgdesc="SSH server and client configuration auditing"
arch=('any')
url="https://github.com/jtesta/ssh-audit"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest-runner')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('6eb7cd3a482cc89e81f462ca1f0c50543ca9ae8db38fcd333cf7a2f7ade3a982268b3cc94d73ce9930d118f390ff3fc525daa955ce47ef8b371b6e20c1dcdee8')

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

check() {
  cd "$pkgname-$pkgver"
  python setup.py pytest
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" --skip-build
  install -Dm644 -t "$pkgdir"/usr/share/man/man1 ssh-audit.1
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}
