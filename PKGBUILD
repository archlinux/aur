# Maintainer: Sergio Tridente <tioduke at gmail dot com >
# Contributor: Steven Noonan <steven@uplinklabs.net>

pkgname=qemu-user-static
pkgver=2.12
pkgrel=3
pkgdesc="A generic and open source processor emulator which achieves a good emulation speed by using dynamic translation, statically linked."
arch=('i686' 'x86_64')
license=('GPL2' 'LGPL2.1')
url="http://wiki.qemu.org/Index.html"
depends=()
optdepends=('binfmt-qemu-static: to allow handling foreign ELF binaries and executing them via qemu')
conflicts=()
_arch=amd64
[ "$CARCH" = 'i686' ] && _arch=i386
_debsrc=${pkgname}_${pkgver}+dfsg-1+b1_${_arch}.deb
source=(http://ftp.debian.org/debian/pool/main/q/qemu/${_debsrc})
sha1sums=('3a3e68ab33df91bf96451d5e529a288608a15020')
[ "$CARCH" = 'i686' ] && sha1sums=('35ba56530f4337382ed064be4a5bf5ba24233753')

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
