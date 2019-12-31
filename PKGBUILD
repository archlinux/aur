# Maintainer: nblock <nblock [/at\] archlinux DOT us>

pkgname=urlwatch-git
pkgver=r501.5d5b108
pkgrel=1
pkgdesc="A tool for monitoring webpages for updates"
arch=('any')
url="http://thp.io/2008/urlwatch/"
license=('BSD')
depends=('python'
         'python-appdirs'
         'python-cssselect'
         'python-keyring'
         'python-lxml'
         'python-minidb'
         'python-pycodestyle'
         'python-requests'
         'python-yaml')
makedepends=('git' 'python-setuptools')
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
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname"
  python setup.py install --root="$pkgdir" --prefix=/usr --optimize=1
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
