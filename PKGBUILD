# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Gilles CHAUVIN <gcnweb at gmail dot com>

pkgname=netpipe
pkgver=3.7.2
pkgrel=2
pkgdesc="A protocol independent performance tool that visually represents the network performance."
url="http://bitspjoule.org/netpipe/"
depends=('glibc')
optdepends=('tcsh: for nplaunch script')
source=(http://deb.debian.org/debian/pool/main/n/netpipe/netpipe_$pkgver.orig.tar.gz)
arch=('i686' 'x86_64')
license=('GPL')
sha256sums=('13dac884ff52951636f651c421f5ff4a853218a95aa28a4a852402ee385a2ab8')

prepare() {
  cd "$srcdir"/NetPIPE-$pkgver
  sed -r 's#\$cwd/##' -i bin/nplaunch
}

build() {
  cd "$srcdir"/NetPIPE-$pkgver
  make memcpy tcp
}

package() {
  cd "$srcdir"/NetPIPE-$pkgver
  install -Dm0755 bin/nplaunch  "$pkgdir"/usr/bin/nplaunch
  install -Dm0755 NPmemcpy      "$pkgdir"/usr/bin/NPmemcpy
  install -Dm0755 NPtcp         "$pkgdir"/usr/bin/NPtcp
  install -Dm0644 dox/netpipe.1 "$pkgdir"/usr/share/man/man1/netpipe.1
}
