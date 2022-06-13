# Maintainer: taotieren <admin@taotieren.com>

pkgname=mindmaster-nativefier
pkgver=1.0.0
pkgrel=0
pkgdesc="mindmaster desktop built with nativefier"
arch=('x86_64')
url="https://mm.edrawsoft.cn/app/create"
license=('custom')
depends=('gtk3' 'libxss' 'nss')
makedepends=('imagemagick' 'nodejs-nativefier' 'unzip')
source=('mindmaster-nativefier.desktop')
sha256sums=('9cbc51bb56ef55c6c0621bfd02b84269e7377254b01c8623b0aaae301bec49ba')

build() {
  nativefier \
    --name "mindmaster" \
    --verbose \
    --single-instance \
    --tray \
    "$url" \
    "mindmaster"
}

package() {
  cd $srcdir
  cd mindmaster
  cd */
  install -dm755 "${pkgdir}/"{opt,usr/{bin,share/{applications,licenses/${pkgname}}}}
  find . -type f -exec install -Dm755 "{}" "$pkgdir/opt/$pkgname/{}" \;
  cd $srcdir
  install -Dm644 "${pkgdir}/opt/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/"
  ln -s "/opt/$pkgname/mindmaster" "$pkgdir/usr/bin/$pkgname"
}
