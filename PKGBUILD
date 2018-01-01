# Maintainer: Daniël de Kok <me@danieldk.eu>
pkgname=fsa6
pkgver=280
pkgrel=3
pkgdesc="Finite state automata utilities"
arch=("x86_64")
url="http://odur.let.rug.nl/~vannoord/Fsa/"
license=('GPL2')
depends=('tcl' 'tk')
optdepends=('python: generation of Python bindings for C automata'
            'java-environment: Java support')
source=("http://odur.let.rug.nl/~vannoord/Fsa/binaries/fsa6-${pkgver}-x86_64-linux-glibc2.19.tar.gz"
        fsa6.sh
        fsa6.png
        fsa6.desktop)
sha256sums=('1b140b9d31bc1a504893ad17b59893e89e2140ea943e7642e9b4efe616f46093'
            '50de3778accfbb989258488a34b00149ae1fc00c989ce8870f16fc8eeb0cacf8'
            'd0997dcf378b28bd7051c1d1da1fe53acbef59344787c0bbb925456669d56a0b'
            'd82b3baa9f634188bbbe4b005ad2d036e54e45c7df9bf7825d41ba1173a8702a')

package() {
  install -dm 755 "${pkgdir}"/{usr/lib,usr/bin}
  cp -R "$srcdir"/fsa6 "${pkgdir}"/usr/lib/fsa6

  # Remove stray .svn directory.
  rm -rf "${pkgdir}"/usr/lib/fsa6/.svn

  # The current version of the FSA utilities expect TCL/TK 8.4.
  ln -sf /usr/lib/libtcl8.6.so "${pkgdir}"/usr/lib/fsa6/binary/create/libtcl8.5.so
  ln -sf /usr/lib/libtk8.6.so "${pkgdir}"/usr/lib/fsa6/binary/create/libtk8.5.so

  install -m 755 "$srcdir"/fsa6.sh "${pkgdir}"/usr/bin/fsa6
  install -Dm 644 "$srcdir"/fsa6.desktop "$pkgdir"/usr/share/applications/fsa6.desktop
  install -Dm 644 "$srcdir"/fsa6.png "$pkgdir"/usr/share/pixmaps/fsa6.png
}
