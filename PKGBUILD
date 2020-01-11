# Maintainer : Florent H. CARRÉ <colundrum@gmail.com>

pkgname=hardening-check
_pkgname=hardening-wrapper
pkgver=2.8+nmu3
pkgrel=3
pkgdesc="Check binaries for security hardening features"
arch=('any')
url="http://wiki.debian.org/Hardening"
license=('GPL2')
depends=('bash' 'perl')
source=("https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/hardening-wrapper/${pkgver}ubuntu1/hardening-wrapper_${pkgver}ubuntu1"{.tar.xz,.dsc})
sha256sums=('5e494c08e770152c4f06965a5833242d00428fe9b17dde5de11e7cdea4be5d54'
            '584c510ef5d6c27b8062f1d57e48a10942426f4b1b98b6c468108abe33cf2da3')

build() {
  cd "$srcdir/$_pkgname-${pkgver}ubuntu1"

  # Irrelevant, we don't ship the wrappers.
  make DEB_HOST_ARCH_OS=amd64 DEB_HOST_ARCH=amd64
}

package() {
  cd "$srcdir/$_pkgname-${pkgver}ubuntu1/build-tree"
  install -Dm0755 'hardening-check' "$pkgdir/usr/bin/hardening-check"
  install -Dm0755 '../hardening-check.sh' "$pkgdir/usr/bin/hardening-check.sh"
  install -Dm0755 'hardening-check.1' "$pkgdir/usr/share/man/man1/hardening-check.1" \
  && chmod -c 0444 "$pkgdir/usr/share/man/man1/hardening-check.1"
}

# vim:set ts=2 sw=2 et:
