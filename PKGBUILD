# Maintainer: Anıl Akpınar <meme4empty@gmail.com>
pkgname=cad-viewer-bin
_pkgname=cad-viewer
pkgver=1.7.0
pkgrel=1
pkgdesc="Browser-based DWG/DXF CAD viewer, desktop app on system Electron (prebuilt, offline fonts)"
arch=('any')
url="https://github.com/mlightcad/cad-viewer"
license=('MIT')
depends=('electron' 'bash' 'hicolor-icon-theme')
provides=('cad-viewer')
conflicts=('cad-viewer')
_caddata=b85f147f388447b2d0ab828b1299622c18c2c276
source=("cad-viewer-web-dist-$pkgver.tar.gz::https://github.com/4ni1ak/cad-viewer/releases/download/v$pkgver/cad-viewer-web-dist-$pkgver.tar.gz"
        "cad-data-$_caddata.tar.gz::https://github.com/mlightcad/cad-data/archive/$_caddata.tar.gz"
        "mlightcad.svg::https://raw.githubusercontent.com/mlightcad/cad-viewer/v$pkgver/docs/public/logo.svg"
        'cad-viewer-main.js'
        'cad-viewer.desktop'
        'cad-viewer.sh')
sha256sums=('a546bad07c70b3d5a19e1da5302531117e5fa70b4a29104258e0be95035bb24b'
            '0a901b2d2a3030a1b280472037eefa3145b549df877b711322a92fccbc5a127f'
            '168d56196459b851e93844f28e336d4157927ea84b3550c0c406e844a22ee14d'
            '3e13b9262fd5be3482618a13c661a90a372885bd1f2d9873b51fc188109e0f81'
            'f5c19db2b6aa8357b3a1f34e5ff2bdddf19d4a8fcf43ccac4f12e651b68a70eb'
            'e9d8c7dede097c64e3414c58872dfcc593aa6d1eb37e5896fb2d9a16d573ae00')

package() {
  install -dm755 "$pkgdir/usr/lib/cad-viewer/cad-data"
  cp -r "$srcdir/web" "$pkgdir/usr/lib/cad-viewer/web"
  cp -r "$srcdir/cad-data-$_caddata/fonts" "$srcdir/cad-data-$_caddata/templates" \
    "$pkgdir/usr/lib/cad-viewer/cad-data/"
  install -Dm644 "$srcdir/cad-viewer-main.js" "$pkgdir/usr/lib/cad-viewer/main.js"

  install -Dm755 "$srcdir/cad-viewer.sh" "$pkgdir/usr/bin/cad-viewer"
  install -Dm644 "$srcdir/cad-viewer.desktop" \
    "$pkgdir/usr/share/applications/cad-viewer.desktop"
  install -Dm644 "$srcdir/mlightcad.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/cad-viewer.svg"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
