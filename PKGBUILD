# Maintainer: taotieren <admin@taotieren.com>

pkgname=bilibili-nativefier
pkgver=1.0.0
pkgrel=0
pkgdesc="bilibili desktop built with nativefier"
arch=('x86_64')
url="https://www.bilibili.com"
license=('custom')
depends=('gtk3' 'libxss' 'nss')
makedepends=('imagemagick' 'nodejs-nativefier' 'unzip')
source=('bilibili-nativefier.desktop')
sha256sums=('ffa5a1532c61750fc7068283f42485dab4dfe42fe4910341c9796c0ee006a2e1')

build() {
  nativefier \
    --name "bilibili" \
    --verbose \
    --single-instance \
    --tray \
    "$url" \
    "bilibili"
}

package() {
  cd $srcdir
  cd bilibili
  cd */
  install -dm755 "${pkgdir}/"{opt,usr/{bin,share/{applications,licenses/${pkgname}}}}
  find . -type f -exec install -Dm755 "{}" "$pkgdir/opt/$pkgname/{}" \;
  cd $srcdir
  install -Dm644 "${pkgdir}/opt/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/"
  ln -s "/opt/$pkgname/bilibili" "$pkgdir/usr/bin/$pkgname"
}
