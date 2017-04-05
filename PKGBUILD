pkgname=httpie-unixsocket-git
pkgver=r18.76d98b2
pkgrel=1
pkgdesc="UNIX socket transport plugin for HTTPie"
arch=('any')
url="https://github.com/httpie/httpie-unixsocket"
license=('custom:BSD')
depends=('httpie' 'python-requests-unixsocket')
makedepends=('git' 'python-setuptools')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=('git+https://github.com/httpie/httpie-unixsocket.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-*}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname%-*}"
  python setup.py build
}

package() {
  cd "$srcdir/${pkgname%-*}"
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
