# Contributor: mica eked <micaeked at gmail dot com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=blackhole-git
pkgver=0.2.r8.g3f78eb7
pkgrel=1
pkgdesc="module system for gambit-c scheme"
arch=('x86_64')
url="http://github.com/pereckerdal/blackhole"
license=('custom')
depends=('glibc')
makedepends=('git' 'gambit-c')
source=("git+https://github.com/pereckerdal/blackhole.git" compilescript.diff)
sha256sums=('SKIP'
            '5d2c5bf85eab249df3bd67c4a297a4705037524e1d683c604eb58dbf8ecfb3a2')

pkgver() {
  cd ${pkgname%-git}
  git describe --tags|sed 's+-+.r+'| tr - . 
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
