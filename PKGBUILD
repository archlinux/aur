# Maintainer: Robert F. Nash <robert@robertnash.net>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Mathieu Clabaut <mathieu.clabaut@gmail.com>

pkgname=thinkingrock
pkgver=2.2.1
pkgrel=6
pkgdesc="Java-based GTD application"
arch=('any')
url="http://www.thinkingrock.com.au"
license=('CDDL')
depends=('jre6-compat' 'xdg-utils' 'hicolor-icon-theme' 'gendesk')
install="$pkgname.install"
source=("http://downloads.sourceforge.net/thinkingrock/tr-$pkgver.tar.gz"
        'dirstructure.patch'
        "$pkgname.png"
        "$pkgname.install")
sha256sums=('f54d3206fed91aacef776f3d66979bc0bb97893e3e922738fa3156c4fcdedc42'
            '9d2f499543fb5062d38aedd17b480e46ad3c44e4c6e00e583e651d90eaaf3c1e'
            '921b96171fa464fada4362e8bc14e217f23e15aa4745d297b44ec504ce98db06'
            'f8f6bdbcd42d322f7325beaf927b3ef7b5a769070e91d2b89f1a6815f1fa68f7')

prepare() {
  cd "tr-$pkgver"

  gendesk -f -n --pkgname "$pkgname" --pkgdesc "$pkgdesc" \
    --categories 'Office;Java'
  patch -Np1 < ../dirstructure.patch
}

package() {
  cd "tr-$pkgver"

  install -d "$pkgdir/opt/$pkgname" "$pkgdir/usr/share/pixmaps"
  cp -r etc ide10 platform9 tr "$pkgdir/opt/$pkgname"
  rm -f "$pkgdir/opt/$pkgname/etc/tr.conf~"
  install -Dm644 "$pkgname.desktop" \
      "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 bin/tr.png \
      "$pkgdir/usr/share/icons/hicolor/48x48/apps/$pkgname.png"
  install -Dm644 "../$pkgname.png" \
      "$pkgdir/usr/share/icons/hicolor/128x128/apps/$pkgname.png"
  ln -s "../icons/hicolor/128x128/apps/$pkgname.png" \
      "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm755 bin/tr "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:
