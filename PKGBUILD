# Maintainer: FACT-Finder <ff-dev@omikron.net>

pkgname=snage-bin
pkgver=0.0.13
pkgrel=1
pkgdesc="A tool for managing change logs."
arch=(any)
url="https://github.com/FACT-Finder/snage"
license=('MIT')
depends=('nodejs')
provides=('snage')
conflicts=('snage')
makedepends=('yarn')

source=("snage-$pkgver.tar.gz::https://registry.npmjs.org/snage/-/snage-$pkgver.tgz"
        "snage-$pkgver-src.tar.gz::https://github.com/FACT-Finder/snage/archive/v$pkgver.tar.gz")
sha256sums=('2bdf4148c056eb97e12c659f56294fb4af7c3748195b10f39f2406fbe9f0309b'
            '59fe8b5d74d431936ddf5bbea81a42cfe7ac5618e2a2619323a2583949006211')
options=(!strip)

package() {
  install -d "$pkgdir/usr/lib/snage"
  cd "$pkgdir/usr/lib/snage"
  cp -a "$srcdir/package/build/." .

  chmod +x "snage.js"

  install -d "$pkgdir/usr/bin"
  ln -s "/usr/lib/snage/snage.js" "$pkgdir/usr/bin/snage"
  install -Dm644 -t "$pkgdir/usr/share/licenses/snage" "$srcdir/snage-$pkgver/LICENSE"
}
