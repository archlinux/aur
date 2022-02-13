# Maintainer: Julian Mac Kenzie <jukiangm@gmail.com>

pkgname=netflix-nativefier
pkgver=1.0.1
pkgrel=0
pkgdesc="Netflix desktop built with nativefier"
arch=('x86_64')
url="https://www.netflix.com"
license=('custom')
depends=('gtk3' 'nss')
makedepends=('imagemagick' 'nodejs-nativefier' 'unzip')
source=('netflix-nativefier.desktop')
sha256sums=('3de315b9c3de5e138bea96ce9e80db5f61ef3de892bfcc957ffd471023a06da7')

build() {
  cd $srcdir
  nativefier \
    --name "Netflix" \
    "$url" \
    "netflix"
}

package() {
  cd $srcdir
  cd netflix
  cd */
  install -dm755 "${pkgdir}/"{opt,usr/{bin,share/{applications,licenses/${pkgname}}}}
  find . -type f -exec install -Dm755 "{}" "$pkgdir/opt/$pkgname/{}" \;
  cd $srcdir
  install -Dm644 "${pkgdir}/opt/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/"
  ln -s "/opt/$pkgname/Netflix" "$pkgdir/usr/bin/$pkgname"
}
