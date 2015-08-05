# PKGBUILD FIXES BY SHAPESHIFTER499 08/04/2015
# Maintainer: Noel Maersk <veox at wemakethings dotnet>
# Contributor: Mike Lenzen <lenzenmi@gmail.com>

pkgname=litecoin-git
_gitname=litecoin
epoch=1
pkgver=4179.88e2a2e
pkgrel=1
pkgdesc="A peer-to-peer network-based digital currency (git version)"
arch=('i686' 'x86_64')
url="http://www.litecoin.org/"
license=('MIT')
depends=('qt4' 'gcc-libs' 'miniupnpc' 'openssl' 'db4.8' 'protobuf')
makedepends=('pkg-config' 'git' 'boost-libs' 'boost' 'gcc' 'qrencode' 'make' 'automoc4' 'automake' 'autoconf' 'libtool')
provides=('litecoin' 'litecoin-qt' 'litecoind' 'litecoin-bin')
conflicts=('litecoin' 'litecoin-qt' 'litecoind' 'litecoin-bin')
source=('git://github.com/litecoin-project/litecoin.git')
md5sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir/$_gitname"
  ./autogen.sh
  ./configure
   make

}

package() {
  # install litecoin-qt client
  install -D -m755 "$srcdir/$_gitname/src/qt/litecoin-qt" "$pkgdir/usr/bin/litecoin-qt"

  # install litecoin daemon
  install -D -m755 "$srcdir/$_gitname/src/litecoind" "$pkgdir/usr/bin/litecoind"

  # install license
  install -D -m644 "$srcdir/$_gitname/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
