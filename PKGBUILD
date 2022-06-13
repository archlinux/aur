# Maintainer: taotieren <admin@taotieren.com>

pkgname=edrawmax-nativefier
pkgver=1.0.0
pkgrel=0
pkgdesc="edrawmax desktop built with nativefier"
arch=('x86_64')
url="https://www.edrawmax.cn/online/zh/"
license=('custom')
depends=('gtk3' 'libxss' 'nss')
makedepends=('imagemagick' 'nodejs-nativefier' 'unzip')
source=('edrawmax-nativefier.desktop')
sha256sums=('2c85f8cd4e6a52bdfba2bb0c13a776f94f2953b3edd7a4d822688c88b45e730e')

build() {
  nativefier \
    --name "edrawmax" \
    --verbose \
    --single-instance \
    --tray \
    "$url" \
    "edrawmax"
}

package() {
  cd $srcdir
  cd edrawmax
  cd */
  install -dm755 "${pkgdir}/"{opt,usr/{bin,share/{applications,licenses/${pkgname}}}}
  find . -type f -exec install -Dm755 "{}" "$pkgdir/opt/$pkgname/{}" \;
  cd $srcdir
  install -Dm644 "${pkgdir}/opt/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/"
  ln -s "/opt/$pkgname/edrawmax" "$pkgdir/usr/bin/$pkgname"
}
