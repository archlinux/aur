# Maintainer: Thomas Jost <schnouki@schnouki.net>
pkgname=blaeu-git
pkgver=1.1.7.r2.3956cce
pkgrel=1
pkgdesc="A set of Python programs to start distributed Internet measurements on the network of RIPE Atlas probes, and to analyze their results"
arch=(any)
url="https://framagit.org/bortzmeyer/blaeu/"
license=('MIT')
depends=('python-cymruwhois' 'python-dnspython' 'python-pyopenssl')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('blaeu::git+https://framagit.org/bortzmeyer/blaeu.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "%s" "$(git describe --long --tags | sed 's/^release-//; s/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  python setup.py build
}

package() {
  cd "$srcdir/${pkgname%-git}"
  python setup.py install --root="$pkgdir" --prefix=/usr
  install -Dm644 LICENCE "$pkgdir"/usr/share/licenses/blaeu-git/LICENCE
}
