# Maintainer: taotieren <admin@taotieren.com>

pkgname=hqdfm-nativefier
pkgver=0.0.2
pkgrel=0
pkgdesc="hqdfm desktop built with nativefier"
arch=('x86_64')
url="https://dfm.elecfans.com/viewer/"
license=('custom')
depends=('gtk3' 'libxss' 'nss')
makedepends=('imagemagick' 'nodejs-nativefier' 'unzip')
source=('hqdfm-nativefier.desktop')
sha256sums=('f29f9efa430875580b1b1fd77bcd74620e9e1259d8f4c9b1b4ff0dcdd7f47240')

build() {
  nativefier \
    --name "hqdfm" \
    --verbose \
    --single-instance \
    --tray \
    "$url" \
    "hqdfm"
}

package() {
  cd $srcdir
  cd hqdfm
  cd */
  install -dm755 "${pkgdir}/"{opt,usr/{bin,share/{applications,licenses/${pkgname}}}}
  find . -type f -exec install -Dm755 "{}" "$pkgdir/opt/$pkgname/{}" \;
  cd $srcdir
  install -Dm644 "${pkgdir}/opt/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/"
  ln -s "/opt/$pkgname/hqdfm" "$pkgdir/usr/bin/$pkgname"
}
