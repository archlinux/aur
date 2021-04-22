# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=firefox-etag-stoppa
pkgver=0.4
_commit=7ab7da5597f177ee08132fd777e3873acca97074
pkgrel=2
pkgdesc='Prevents Firefox from storing entity tags by removing ETag response headers unconditionally and without exceptions'
url=https://github.com/claustromaniac/etag-stoppa
arch=('any')
license=('MIT')
groups=('firefox-addons')
makedepends=('git' 'strip-nondeterminism' 'zip')
source=("git+$url.git#commit=$_commit")
b2sums=('SKIP')
#validpgpkeys=('') # Key for 6FFF2F5AB0F3AA2D not found

package() {
  cd etag-stoppa
  install -d "$pkgdir"/usr/lib/firefox/browser/extensions
  zip -r "$pkgdir"/usr/lib/firefox/browser/extensions/etag-stoppa@cm.org.xpi * \
    -x '.git*' LICENSE
  strip-nondeterminism -t zip "$pkgdir"/usr/lib/firefox/browser/extensions/*.xpi
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}

# vim:set ts=2 sw=2 et:
