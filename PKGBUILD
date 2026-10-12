# Maintainer: Alex Dujardin <contact@alexcrea.xyz>
pkgname=paintdotnet-wine-experimental
pkgver=5.200.9775.2252
pkgrel=3
pkgdesc="Experimental Paint.NET with wine specific changes"
arch=(x86_64)
url="https://github.com/paintdotnet/Paint.NET-on-WINE"
license=('LicenseRef-custom')
depends=('wine>=11.5' winetricks bash)
noextract=("${pkgname}-${pkgver}.zip")

source=(
  "${pkgname}-${pkgver}.zip::https://github.com/paintdotnet/Paint.NET-on-Wine/releases/download/v${pkgver}/paint.net.${pkgver}.portable.x64.wine.EXPERIMENTAL.zip"
  "${pkgname}.sh"
  "${pkgname}.desktop"
)

sha256sums=('0ace05b4397139f502099ab429e302938efc21eaf7db45d078b7e204e5372c6f'
            'f8d5bd9d2d71b060df0aa85877ada4d18ea13765cf39fca2d90520e30afa7ca5'
            '8065aaf824e0f4b7d5e4c0f32cb9e0422b2297175d1b79918ee42041f8f46479')

build() {
  mkdir -p "$srcdir/paintdotnet"
  bsdtar -xf ${pkgname}-${pkgver}.zip -C "$srcdir/paintdotnet"
}

package() {
  install -d "$pkgdir/usr/share/$pkgname"
  cp -a "$srcdir/paintdotnet/." "$pkgdir/usr/share/$pkgname"

  install -Dm755 $pkgname.sh "$pkgdir/usr/bin/$pkgname"
  sed -i "s/pkgname/$pkgname/g" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 $pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
  sed -i "s/pkgname/$pkgname/g" "$pkgdir/usr/share/applications/$pkgname.desktop"

  install -Dm644 "paintdotnet/License.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
