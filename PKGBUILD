# Maintainer: DuckHunt <duckhunt@tfwno.gf>
# Contributor: carstene1ns <url/mail: arch carsten-teibes de>
# Contributor: attila589 <attila589 at gmail dot com>

pkgname=fake86
pkgver=0.13.9.16
pkgrel=2
pkgdesc="An 8086 PC emulator written in C"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://fake86.rubbermallet.org/"
depends=("sdl" "libpcap")
source=("http://downloads.sourceforge.net/sourceforge/fake86/fake86-$pkgver.tar.gz")
sha256sums=('c4f9af66aa1026228a45845bf2bc0ae4eb28b6d0d692c89d4e67f56c3fe3bb20')

prepare() {
  cd $pkgname-$pkgver

  # add xlib for linking
  sed 's|^LIBS=-lpthread -lpcap$|& -lX11|' -i makefile.pcap
}

build() {
  cd $pkgname-$pkgver

  make -f makefile.pcap
}

package() {
  cd $pkgname-$pkgver

  install -d "$pkgdir"/usr/{bin,share/fake86}
  cp bin/* "$pkgdir"/usr/bin
  cp data/* "$pkgdir"/usr/share/fake86
}
