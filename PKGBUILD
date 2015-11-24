# Maintainer: sekret
_pkgname=surf
pkgname=$_pkgname-webkit2gtk-git
pkgver=0.6.178.gc069b76
pkgrel=1
pkgdesc="a WebKit based browser (surf2 branch, which uses webkit2gtk)"
arch=('i686' 'x86_64')
url="http://surf.suckless.org/"
license=('custom:MIT/X')
depends=('webkit2gtk' 'xorg-xprop')
makedepends=('git')
optdepends=('dmenu: url bar and search'
            'ca-certificates: SSL verification'
            'st: default terminal for the download handler'
            'curl: default download handler')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+http://git.suckless.org/surf#branch=surf-webkit2"
        'config.h')
md5sums=('SKIP'
         'SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --tags | sed 's/-/\./g'
}

prepare() {
  cd "$_pkgname"
  #cp "$srcdir/config.h" .
}

build() {
  cd "$_pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir"
}

package() {
  cd "$_pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
