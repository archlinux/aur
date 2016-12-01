# Maintainer: nblock <nblock [/at\] archlinux DOT us>

pkgname=urlwatch-git
pkgver=r225.4660f07
pkgrel=1
pkgdesc="A tool for monitoring webpages for updates"
arch=('any')
url="http://thp.io/2008/urlwatch/"
license=('BSD')
depends=('python-keyring' 'python-minidb' 'python-requests' 'python-yaml')
makedepends=('git')
provides=('urlwatch')
conflicts=('urlwatch')
source=("${pkgname}::git+https://github.com/thp/urlwatch.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  python3 setup.py build
}

package() {
  cd "$srcdir/$pkgname"
  python3 setup.py install --root="$pkgdir" --prefix=/usr --optimize=1
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
