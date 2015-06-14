# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab
# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>

pkgname=zthread
_pkgname=ZThread
pkgver=2.3.2
pkgrel=1
pkgdesc='A platform-independent, multi-threading and synchronization library for C++'
arch=('i686' 'x86_64')
url='http://zthread.sourceforge.net/'
license=('MIT')
groups=()
depends=(bash gcc-libs)
makedepends=('automake=1.10')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=''
options=(!emptydirs libtool)
source=("$pkgname-$pkgver.tar.gz::http://prdownloads.sourceforge.net/zthread/ZThread-${pkgver}.tar.gz"
zthread.patch
https://raw.github.com/freddix/pkgs.old/master/ZThread/ZThread-destdir.patch
)
noextract=()

build(){
  cd "$srcdir"/$_pkgname-$pkgver
  patch -p1 -i $srcdir/zthread.patch
  patch -p1 -i $srcdir/ZThread-destdir.patch
  CXXFLAGS+=' -fpermissive'

  ./configure --prefix=/usr
  make
}
package(){
  cd "$srcdir"/$_pkgname-$pkgver

  make DESTDIR="$pkgdir/" install
  install -Dm644 MIT.TXT "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
md5sums=('f2782d19b8ed6f1ff2ab8824dd4ba48e'
         '060cca98aa08f5ebed17d6a1650ddc07'
         'bd43a630a11380918e048f471b8f937a')
