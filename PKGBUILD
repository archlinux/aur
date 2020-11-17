# Maintainer: xiretza <xiretza+aur@xiretza.xyz>

_srcname=litesdcard
pkgname="python-$_srcname-git"
pkgver=2020.08.r14.g9e267a5
pkgrel=1
pkgdesc="A small footprint and configurable SDCard core for LiteX"
arch=(any)
url="https://github.com/enjoy-digital/litesdcard"
license=('MIT')
depends=(python python-migen python-litex)
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
