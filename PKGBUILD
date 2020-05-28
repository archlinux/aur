# Maintainer: AwesomeHaircut <jesusbalbastro at gmail com>
# Maintainer: Mateusz Gozdek <mgozdekof@gmail.com>
# Contributor: Rein Fernhout <public@reinfernhout.xyz>
# Past Contributor: James An <james@jamesan.ca>

pkgname=droidcam
pkgver=1.1
pkgrel=1
epoch=1
pkgdesc='A tool for using your android device as a wireless/usb webcam'
arch=('x86_64')
url="https://www.dev47apps.com/${pkgname}/linuxx"
license=('GPL')
depends=('v4l2loopback-dc-dkms')
optdepends=('gtk2: use GUI version in addition to CLI interface' )

source=("${pkgname}.desktop"
        "0001-Use-shared-version-of-libjpeg-turbo.patch"
        "droidcam.zip::https://github.com/aramg/${pkgname}/archive/v${pkgver}.zip"
)

sha512sums=('72d21aa2d7eecc9bb070aaf7059a671246feb22f9c39b934a5463a4839f9347050de00754e5031dbc44f78eb2731f58f0cd2fcf781bc241f6fbd1abb4308b7ee'
            '4ae0849efb8f9183cae75d0ccc1459afe186de6479d47d4634c78c43ab9d92e46bf33d2f68e93134c4d67569cd5421d408013371ad2d5c33d60c0af5de284deb'
            'f02a76eb5323b62db9a54107a42e2150e2dfc27ab0acb5600ec0ed09e0512c2b7a21dd2105125d4f4d482348c807bf87f2d96131ce5b46e89d60a3b6f67d3a53')

prepare() {
  cd "${pkgname}-${pkgver}"
  patch -p0 --input="${srcdir}/0001-Use-shared-version-of-libjpeg-turbo.patch"
}

build() {
  cd ${pkgname}-${pkgver}/linux

  make
}

package() {
  pushd ${pkgname}-${pkgver}/linux

  # Install droidcam program files
  install -Dm755 "${pkgname}" "$pkgdir/usr/bin/${pkgname}"
  install -Dm755 "${pkgname}-cli" "$pkgdir/usr/bin/${pkgname}-cli"
  install -Dm644 icon2.png "$pkgdir/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 "../../${pkgname}.desktop" "$pkgdir/usr/share/applications/${pkgname}.desktop"
  install -Dm644 README.md "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
