# Maintainer: taotieren <admin@taotieren.com>

pkgname=hqdfm-nativefier
pkgver=0.0.1
pkgrel=0
pkgdesc="hqdfm desktop built with nativefier"
arch=('x86_64')
url="https://dfm.elecfans.com/viewer/"
license=('custom')
depends=('gtk3' 'libxss' 'nss')
makedepends=('imagemagick' 'nodejs-nativefier' 'unzip')
source=('hqdfm-nativefier.desktop')
sha256sums=('f65783d73209fadc8894bddc44c76155ee6b0cfd8688ead6f88b56cb7294ea25')

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
