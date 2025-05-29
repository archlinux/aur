pkgbase=coreutils-uutils-symlink
pkgname=(${pkgbase} coreutils-uutils-arch)
pkgver=0.1.0
pkgrel=6
arch=('any')
url='https://uutils.github.io/'
license=('MIT')
depends=(uutils-coreutils)
makedepends=(grep)
package_coreutils-uutils-symlink() {
  pkgdesc="(dangerous) Swap coreutils with uutils"
  depends+=(uutils-coreutils-stty)
  conflicts=(coreutils{,-uutils} b3sum sha3sum)
  provides=(coreutils b3sum)
  uu-install -d "$pkgdir"/usr/{bin,share/man/man1}
  for f in $(uu-coreutils --list|grep -v -E '^(kill|more|uptime|hostname)$');do
    uu-ln -s /usr/bin/uu-coreutils "$pkgdir"/usr/bin/"$f"
    uu-cp -s /usr/share/man/man1/uu-"$f".1.gz "$pkgdir"/usr/share/man/man1/"$f".1.gz 2>/dev/null || uu-true
  done
  uu-ln -s /usr/bin/uu-stty "$pkgdir"/usr/bin/stty
  uu-rm "$pkgdir"/usr/bin/arch
}

package_coreutils-uutils-arch() {
  pkgdesc="Symlink for apps accidently depending on arch"
  conflicts=(coreutils-arch)
  provides=(coreutils-arch)
  uu-install -d "$pkgdir"/usr/bin
  uu-ln -s /usr/bin/uu-coreutils "$pkgdir"/usr/bin/arch
}
