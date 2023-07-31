# Maintainer: taotieren <admin@taotieren.com>

pkgname=mindmaster-nativefier
pkgver=1.0.1
pkgrel=0
pkgdesc="mindmaster collaborative edition built with nativefier"
arch=('x86_64')
url="https://mm.edrawsoft.cn/app"
license=('custom')
depends=('gtk3' 'libxss' 'nss')
makedepends=('imagemagick' 'nodejs-nativefier' 'unzip')
source=('mindmaster-nativefier.desktop')
sha256sums=('b6b56003d87aa0a8b4a40c7684c2494b3728dbda721f1d63367244a7be43912e')

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
