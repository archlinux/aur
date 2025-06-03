pkgdesc="(Dangerous) Swap system coreutils with uutils (more than PATH)"
pkgname=coreutils-uutils-symlink
pkgver=0.1.0
pkgrel=9
arch=('any')
url='https://uutils.github.io/'
license=('MIT')
depends=(uutils-coreutils{,-stty})
makedepends=(grep)
conflicts=(coreutils b3sum sha3sum)
provides=(coreutils{,-uutils} b3sum)
package() {
  uu-install -d "$pkgdir"/usr/{bin,share/man/man1}
  for f in $(uu-coreutils --list|grep -v -E '^(kill|more|uptime|hostname)$');do
    uu-ln -s /usr/bin/uu-coreutils "$pkgdir"/usr/bin/"$f"
    uu-ln -s /usr/share/man/man1/uu-"$f".1.gz "$pkgdir"/usr/share/man/man1/"$f".1.gz
  done
  uu-ln -s /usr/bin/uu-stty "$pkgdir"/usr/bin/stty
}
