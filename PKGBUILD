# Maintainer: sekret, mail=$(echo c2VrcmV0QHBvc3Rlby5zZQo= | base64 -d)

_pkgname=ratox
pkgname=$_pkgname-git
pkgver=0.2.1.r0.g1a84f07
pkgrel=1
pkgdesc="FIFO based tox client"
arch=('i686' 'x86_64')
url="http://ratox.2f30.org"
license=('custom')
depends=('glibc' 'tox-git')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+http://git.2f30.org/ratox/"
        "config.h")
md5sums=('SKIP'
         'SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"
  # uncomment, if you want to use your own config.h
  #cp "$srcdir/config.h" .
}

build() {
  cd "$_pkgname"
  make
}

package() {
  cd "$_pkgname"
  make DESTDIR="$pkgdir" PREFIX=/usr install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
