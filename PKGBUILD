## Maintainer: Thermi <noel[ at ] familie-kuntze.de>
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
source=("https://github.com/axkibe/lsyncd/archive/release-$pkgver.tar.gz"
	"lsyncd.service"
        "configure-a2x-fix.patch")

sha256sums=('aa82fd9bf5737395e374650720c02f033d74a7101b57878ac92f5720ae9e7ece'
            '538072a4505abbdf8c4d16c9200810d4a2253f892a71fc16b5cd7f35ebe1ae57'
            'dff13f88a2fe7103ba4daa22b45c1fb188142571ae064209ec5b956cd6aae6e7') 
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
  install -D ${srcdir}/lsyncd.service ${pkgdir}/usr/lib/systemd/system/lsyncd.service
}
