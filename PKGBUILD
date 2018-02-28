# Maintainer: Sergio Tridente <tioduke at gmail dot com >
# Contributor: Steven Noonan <steven@uplinklabs.net>

pkgname=qemu-user-static
pkgver=2.11
pkgrel=2
pkgdesc="A generic and open source processor emulator which achieves a good emulation speed by using dynamic translation, statically linked."
arch=('i686' 'x86_64')
license=('GPL2' 'LGPL2.1')
url="http://wiki.qemu.org/Index.html"
depends=()
optdepends=('binfmt-qemu-static: to allow handling foreign ELF binaries and executing them via qemu')
conflicts=()
_arch=i386
[ "$CARCH" = 'x86_64' ] && _arch=amd64
_debsrc=${pkgname}_${pkgver}+dfsg-1_${_arch}.deb
source=(http://ftp.debian.org/debian/pool/main/q/qemu/${_debsrc})
sha1sums=('27b3d76952fa0500913a07e1119c0436f34d296e')
[ "$CARCH" = 'i686' ] && sha1sums=('c8d7279069a112af5280f255132bb0c1e76e9da8')

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
