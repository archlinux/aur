# Maintainer: FACT-Finder <ff-dev@omikron.net>

pkgname=snage-bin
pkgver=0.0.14
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
sha256sums=('b529772157419343e8e890e641ed6b66cdda8fab3ad2534f1c44b8cf283ba1cb'
            '64e9422097c2485b31c0af5f856470af129af203ffdeb7981e3dbdf4bb3e5260')
options=(!strip)

package() {
  install -d "$pkgdir/usr/lib/snage"
  cd "$pkgdir/usr/lib/snage"
  cp -a "$srcdir/package/build/npm/." .

  chmod +x "snage.js"

  install -d "$pkgdir/usr/bin"
  ln -s "/usr/lib/snage/snage.js" "$pkgdir/usr/bin/snage"
  install -Dm644 -t "$pkgdir/usr/share/licenses/snage" "$srcdir/snage-$pkgver/LICENSE"
}
