# Maintainer : Florent H. CARRÉ <colundrum@gmail.com>

pkgname=hardening-check
_pkgname=hardening-wrapper
pkgver=2.7
pkgrel=1
pkgdesc="Check binaries for security hardening features"
arch=('any')
url="http://wiki.debian.org/Hardening"
license=('GPL2')
depends=('bash' 'perl')
source=("http://ftp.de.debian.org/debian/pool/main/h/hardening-wrapper/hardening-wrapper_$pkgver"{.tar.xz,.dsc})
sha256sums=('20c601c6ccac7534d17d4be9442a4ad8f02b8461c2c50dee8b45d596cd6cf8e7'
            'a41080316928a0e086a622dcdae12fefb45abbaec6c435fa98e39754dfe64d79')

build() {
  cd "$srcdir/$_pkgname"

  # Irrelevant, we don't ship the wrappers.
  make DEB_HOST_ARCH_OS=amd64 DEB_HOST_ARCH=amd64
}

package() {
  cd "$srcdir/$_pkgname/build-tree"
  install -Dm0755 'hardening-check' "$pkgdir/usr/bin/hardening-check"
  install -Dm0755 '../hardening-check.sh' "$pkgdir/usr/bin/hardening-check.sh"
  install -Dm0755 'hardening-check.1' "$pkgdir/usr/share/man/man1/hardening-check.1" \
    && chmod -c 0444 "$pkgdir/usr/share/man/man1/hardening-check.1"
}

# vim:set ts=2 sw=2 et:
