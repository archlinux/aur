# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>
# Maintainer: Jean Lucas <jean@4ray.co>
# Contributor: kaptoxic <kaptoxic at yahoo dot com>
# Contributor: Matthew Avant <matthew dot avant at gmail dot com>
# Contributor: Rose Ames <rose at happyspork dot com>

pkgname=zulip-desktop-bin
pkgver=4.0.0
pkgrel=3
pkgdesc='Real-time team chat based on the email threading model (bin)'
arch=(x86_64)
url=https://zulipchat.com
license=(Apache)
depends=(libxkbfile gtk3 libxss nss)
makedepends=(unzip)
provides=(zulip-desktop)
conflicts=(zulip-desktop)
source=(https://github.com/zulip/zulip-desktop/releases/download/v$pkgver/Zulip-$pkgver-linux-x64.zip
        zulip.desktop
        https://raw.githubusercontent.com/zulip/zulip-desktop/v$pkgver/build/zulip.png
        https://raw.githubusercontent.com/zulip/zulip-desktop/v$pkgver/LICENSE)
noextract=(Zulip-$pkgver-linux-x64.zip)
sha512sums=('4bbed4d0b781e2964dee51e6ea313c6e6b74d1e6cc47aad70d3a4f127bbde5d4462a19355ed49f4026c0904d38927a37f691fc962a0fa6971c6bd6e878d51f9d'
            '7696a6874d17957f99452452723ae1a6b32b6814b018361a71ed1fe0191e1c6da6f3ad693e2e279615e74f687c380ff2f6dab8b69fcd82476e8f33b56a6b4cb5'
            '5ef9d1acdc72e7bb5b00574866f78fc2f0ea38a0179055b981c20e623b1a0e6a110cad05b487d74662bd290f76b97fe7599ef8559facb766af55da1346493ca6'
            '389080b6132d3eaae780648d6998390d8cc71908561bce09578e27c542aa1a9f3122e01f640c5b01bee73004c23aa4e9f2066fe5ee0ca2072c2420578b28d71f')

package() {
  _dest="$pkgdir"/usr/lib/zulip-desktop
  mkdir -p $_dest
  unzip -d $_dest Zulip-$pkgver-linux-x64.zip

  mkdir "$pkgdir"/usr/bin
  ln -s /usr/lib/zulip-desktop/zulip -t "$pkgdir"/usr/bin

  install -Dm 644 zulip.desktop -t "$pkgdir"/usr/share/applications
  install -Dm 644 zulip.png -t "$pkgdir"/usr/share/pixmaps

  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/zulip-desktop
}
