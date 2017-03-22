# Submitter:  Milan Knížek <knizek@volny.cz>
# Maintainer: Milan Knížek <knizek@volny.cz>

pkgname=x2godesktopsharing
pkgver=3.1.1.3
pkgrel=1
pkgdesc="X2Go add-on tool that allows a user to grant other X2go users access to the current session (shadow session support)."
arch=('x86_64')
url="http://www.x2go.org/"
license=('GPL')
depends=('x2goserver>=4.0.1' 'qt4>=4.5')
options=(emptydirs)
groups=('x2go' 'alts')
source=("https://code.x2go.org/releases/source/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "https://code.x2go.org/releases/source/${pkgname}/${pkgname}-${pkgver}.tar.gz.asc"
        'x2godesktopsharing-sysusers.conf')
md5sums=('e5d4c4393ed5dde7e0790d7cded56cc2'
         'SKIP'
         'd10b90b9a038bed5e91ba821d8ac874c')
sha1sums=('1d94ffb31756c36b7071c53b214b0941244482b6'
          'SKIP'
          'd3fa5d6ba6aa0a9d6925b97bf0ae51581cdabd8d')
sha512sums=('e6a8ee81cbc2211951d0676fad5fd4102069dd66a013e74a955e28c0a1e5429ef1a334a9b028ec278633c61f59e66c29e329f4a2a4354263fce359035c12ed6f'
            'SKIP'
            '67aae752373174504d5b2de52f2b4bb195cc111033525a9e166bcd0da79ef9be0295850666050f1847a9f2895bb20656b3f1ca82b4c0565d2c35769be6542e4f')
validpgpkeys=('1AD23D1B8F087A35AB74BDE9F4A7678C9C6B0B2B')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  qmake-qt4 x2godesktopsharing.pro
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -D -m 755 x2godesktopsharing "$pkgdir/usr/bin/x2godesktopsharing"
  install    -m 755 bin/x2goresume-desktopsharing "$pkgdir/usr/bin/x2goresume-desktopsharing"
  install    -m 755 bin/x2gosuspend-desktopsharing "$pkgdir/usr/bin/x2gosuspend-desktopsharing"
  install    -m 755 bin/x2goterminate-desktopsharing "$pkgdir/usr/bin/x2goterminate-desktopsharing"

  install -d -m 755 "$pkgdir/usr/share/applications"
  install    -m 644 x2godesktopsharing.desktop "$pkgdir/usr/share/applications/x2godesktopsharing.desktop"

  install -d -m 755 "$pkgdir/usr/share/x2godesktopsharing/icons"
  install    -m 644 icons/x2godesktopsharing.xpm "$pkgdir/usr/share/x2godesktopsharing/icons/x2godesktopsharing.xpm"

  install -d -m 755 "$pkgdir/usr/share/icons/hicolor/128x128/apps"
  install    -m 644 icons/128x128/x2godesktopsharing.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/x2godesktopsharing.png"

  install -d -m 755 "$pkgdir/usr/share/icons/hicolor/16x16/apps"
  install    -m 644 icons/16x16/x2godesktopsharing.png "$pkgdir/usr/share/icons/hicolor/16x16/apps/x2godesktopsharing.png"

  install -d -m 755 "$pkgdir/usr/share/icons/hicolor/64x64/apps"
  install    -m 644 icons/64x64/x2godesktopsharing.png "$pkgdir/usr/share/icons/hicolor/64x64/apps/x2godesktopsharing.png"

  install -d -m 755 "$pkgdir/usr/share/icons/hicolor/32x32/apps"
  install    -m 644 icons/32x32/x2godesktopsharing.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/x2godesktopsharing.png"

  gzip man/man1/x2godesktopsharing.1
  install -d -m 755 "$pkgdir/usr/share/man/man1"
  install    -m 644 -t "$pkgdir/usr/share/man/man1" man/man1/x2go*.gz

  gzip man/man8/x2go*-desktopsharing.8
  install -d -m 755 "$pkgdir/usr/share/man/man8"
  install    -m 644 -t "$pkgdir/usr/share/man/man8" man/man8/x2go*-desktopsharing.8.gz

  install -d -m 755 "$pkgdir/usr/share/menu"

  install -d -m 755 -d "${pkgdir}/usr/share/doc/${pkgname}"

  install -d -m 755 "${pkgdir}/usr/share/x2go/versions/"
  echo ${pkgver} > "${pkgdir}/usr/share/x2go/versions/VERSION.$pkgname"

  install -D -m 755 "share/x2gofeature.d/x2godesktopsharing.features" "${pkgdir}/usr/share/x2go/x2gofeature.d/x2godesktopsharing.features"

  install -D -m 644 "$srcdir/x2godesktopsharing-sysusers.conf" "$pkgdir/usr/lib/sysusers.d/x2godesktopsharing.conf"
}
