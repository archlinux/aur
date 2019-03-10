# Contributor: mica eked <micaeked at gmail dot com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=blackhole-git
pkgver=0.2r4.g50bb6fd
pkgrel=1
pkgdesc="module system for gambit-c scheme"
arch=('x86_64')
url="http://github.com/pereckerdal/blackhole"
license=('custom')
depends=('glibc')
makedepends=('git' 'gambit-c')
source=("git+https://github.com/pereckerdal/blackhole.git" compilescript.diff)
md5sums=('SKIP'
         '29094e13f494d335ec70246ce76cadff')

pkgver() {
  cd ${pkgname%-git}
  git describe --tags|sed 's+-+r+'| tr - . 
}

prepare() {
   cd ${pkgname%-git}
   patch -Np1 < "$srcdir"/compilescript.diff
}

build() {
  cd ${pkgname%-git}
  ./compile.sh
}

package() {
  cd ${pkgname%-git}
  install -D -m755 bh "${pkgdir}/usr/bin/bh"
  install -D -m644 LICENSE \
	  "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
