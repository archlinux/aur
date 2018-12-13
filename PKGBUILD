# Maintainer: Sergio Tridente <tioduke at gmail dot com >
# Contributor: Steven Noonan <steven@uplinklabs.net>

pkgname=qemu-user-static
pkgver=3.1
pkgrel=1
pkgdesc="A generic and open source processor emulator which achieves a good emulation speed by using dynamic translation, statically linked."
arch=('i686' 'x86_64')
license=('GPL2' 'LGPL2.1')
url="http://wiki.qemu.org/Index.html"
depends=()
optdepends=('binfmt-qemu-static: to allow handling foreign ELF binaries and executing them via qemu')
conflicts=()
_arch=amd64
[ "$CARCH" = 'i686' ] && _arch=i386
_debsrc=${pkgname}_${pkgver}+dfsg-1_${_arch}.deb
source=(http://ftp.debian.org/debian/pool/main/q/qemu/${_debsrc})
sha1sums=('c3b098d592fd9b7299305cb929029e3bea5abb4f')
[ "$CARCH" = 'i686' ] && sha1sums=('b8ac990a719de238e39c98a663701aa05b87bbe4')

prepare() {
  cd "$srcdir"
  ar p ${_debsrc} data.tar.xz | bsdtar xf -
}

package() {
  cd "$pkgdir"
  mkdir -p "$pkgdir"/usr/bin/
  mkdir -p "$pkgdir"/usr/share/man/

  cp "$srcdir"/usr/bin/* "$pkgdir"/usr/bin/
  cp "$srcdir"/usr/share/man/man1 "$pkgdir"/usr/share/man/ -r
}
