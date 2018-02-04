pkgname=tcpser
pkgver=1.0rc12.fz1.r27.g57d4244
pkgrel=1
pkgdesc="Jim Brain's tcpser serial to IP modem emulator (fork by FozzTexx)"
arch=(i686 x86_64)
url="https://github.com/FozzTexx/tcpser"
license=(GPL2)
_commit=57d4244ee100c9baea8f8356c4741db63796a4a2
source=("git+https://github.com/FozzTexx/tcpser#commit=$_commit"
        "tcpser.1")
sha256sums=('SKIP'
            'd376440db182a0bed9d08624a008aa2cb8a00c0002b8e78316c74533de9ca46e')

pkgver() {
  cd $pkgname
  echo "1.0rc12.fz1.r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cd $pkgname
  make
}

package() {
  cd $pkgname
  install -D -m 755 tcpser      "$pkgdir"/usr/bin/tcpser
  install -D -m 644 README      "$pkgdir"/usr/share/doc/$pkgname/README
  install -D -m 644 README.md   "$pkgdir"/usr/share/doc/$pkgname/README.fozztexx

  cd ..
  install -D -m 644 tcpser.1    "$pkgdir"/usr/share/man/man1/tcpser.1
}

# vim: ts=2:sw=2:et:ft=sh
