# Maintainer : Florent H. CARRÉ <colundrum@gmail.com>

pkgname=hardening-check
_pkgname=hardening-wrapper
pkgver=2.8+nmu2
pkgrel=1
pkgdesc="Check binaries for security hardening features"
arch=('any')
url="http://wiki.debian.org/Hardening"
license=('GPL2')
depends=('bash' 'perl')
source=("http://ftp.de.debian.org/debian/pool/main/h/hardening-wrapper/hardening-wrapper_$pkgver"{.tar.xz,.dsc})
sha256sums=('34274828448b8e58b3d5f8b2006164bdd3b688a8afeae58464c63bbbf64f2916'
            '465be22cde9e2c6e0eeaaa5d6f346e875e06445610f38b4d76938544d721713d')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  # Irrelevant, we don't ship the wrappers.
  make DEB_HOST_ARCH_OS=amd64 DEB_HOST_ARCH=amd64
}

package() {
  cd "$srcdir/$_pkgname-$pkgver/build-tree"
  install -Dm0755 'hardening-check' "$pkgdir/usr/bin/hardening-check"
  install -Dm0755 '../hardening-check.sh' "$pkgdir/usr/bin/hardening-check.sh"
  install -Dm0755 'hardening-check.1' "$pkgdir/usr/share/man/man1/hardening-check.1" \
    && chmod -c 0444 "$pkgdir/usr/share/man/man1/hardening-check.1"
}

# vim:set ts=2 sw=2 et:
