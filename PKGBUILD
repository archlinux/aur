# Maintainer: Thermi <noel[ at ] familie-kuntze.de>
# Submitter: nullie
pkgname=lsyncd
pkgver=2.1.5
pkgrel=1
pkgdesc="Live Syncing (Mirror) Daemon"
arch=('i686' 'x86_64')
url="https://github.com/axkibe/lsyncd"
license=('GPL2')
depends=('lua' 'rsync')
makedepends=('asciidoc')
source=(https://github.com/axkibe/lsyncd/archive/release-$pkgver.tar.gz
                configure-a2x-fix.patch)
sha1sums=('2b8eb169365edc54488a97435bbd39ae4a6731b8'
          'f76243d96dc7930eadd59a81aea516b666569749')
 
build() {
  cd $srcdir/$pkgname-release-$pkgver
  patch -Np1 -i ../configure-a2x-fix.patch
  ./autogen.sh  --prefix=/usr
  ./configure --prefix=/usr
  make
}
 
package() {
  cd $srcdir/$pkgname-release-$pkgver
  make DESTDIR=$pkgdir install
}
