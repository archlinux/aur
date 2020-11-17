# Maintainer: xiretza <xiretza+aur@xiretza.xyz>

_srcname=litedram
pkgname="python-$_srcname-git"
pkgver=2020.08.r101.g1117068
pkgrel=1
pkgdesc="A small footprint and configurable DRAM core for LiteX"
arch=(any)
url="https://github.com/enjoy-digital/litedram"
license=('MIT')
depends=(python-yaml python python-migen python-litex)
makedepends=(git python-setuptools)
provides=("${pkgname%%-git}=$pkgver")
conflicts=("${pkgname%%-git}")
replaces=("$_srcname-git")
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$_srcname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_srcname"
  python setup.py build
}

package() {
  cd "$_srcname"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set et ts=2 syntax=PKGBUILD:
