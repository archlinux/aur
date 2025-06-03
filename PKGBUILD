pkgname=coreutils-uutils-symlink
pkgver=0.1.0
pkgrel=8
arch=('any')
url='https://uutils.github.io/'
license=('MIT')
depends=(uutils-coreutils)
makedepends=(grep)
package_coreutils-uutils-symlink() {
  pkgdesc="(dangerous) Swap coreutils with uutils"
  depends+=(uutils-coreutils-stty)
  conflicts=(coreutils{,-uutils,-arch} b3sum sha3sum)
  provides=(coreutils{,-arch} b3sum)
  uu-install -d "$pkgdir"/usr/{bin,share/man/man1}
  for f in $(uu-coreutils --list|grep -v -E '^(kill|more|uptime|hostname)$');do
    uu-ln -s /usr/bin/uu-coreutils "$pkgdir"/usr/bin/"$f"
    uu-ln -s /usr/share/man/man1/uu-"$f".1.gz "$pkgdir"/usr/share/man/man1/"$f".1.gz
  done
  uu-ln -s /usr/bin/uu-stty "$pkgdir"/usr/bin/stty
}
