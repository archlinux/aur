# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

_name=bookmarkdupes
pkgname=firefox-bookmarkdupes
pkgver=6.6
pkgrel=1
pkgdesc='Display/Remove duplicate bookmarks, empty folders or descriptions'
arch=('any')
url=https://github.com/vaeth/bookmarkdupes
license=('GPL')
groups=('firefox-addons')
makedepends=('strip-nondeterminism' 'zip')
source=("$url/archive/v$pkgver/$_name-$pkgver.tar.gz"
        "$url/releases/download/v$pkgver/$_name-$pkgver.tar.gz.asc")
b2sums=('5c85f883b698dbbfb4a4058107d12f632685eb323e99213dc79fe91c6e2bbd58dce594798a4b2100159fe1890788a612fd065a2f671bc0e66e4a55169ba9cc8c'
        'SKIP')
validpgpkeys=('123D62DD87E7A81CA090CD65D18FC49C6F3A8EC0') # Martin Vaeth <martin@mvath.de>

package() {
  cd $_name-$pkgver
  install -d "$pkgdir"/usr/lib/firefox/browser/extensions
  zip -r "$pkgdir"/usr/lib/firefox/browser/extensions/$_name@martin-vaeth.org.xpi \
    -- *
  strip-nondeterminism -t zip "$pkgdir"/usr/lib/firefox/browser/extensions/*.xpi
}
