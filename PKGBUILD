# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>
# Maintainer: Jean Lucas <jean@4ray.co>
# Contributor: kaptoxic <kaptoxic at yahoo dot com>
# Contributor: Matthew Avant <matthew dot avant at gmail dot com>
# Contributor: Rose Ames <rose at happyspork dot com>

pkgname=zulip-desktop-bin
pkgver=4.0.0
pkgrel=2
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
        https://github.com/zulip/zulip-desktop/blob/v$pkgver/build/zulip.png
        https://github.com/zulip/zulip-desktop/blob/v$pkgver/LICENSE)
noextract=(Zulip-$pkgver-linux-x64.zip)
sha512sums=('4bbed4d0b781e2964dee51e6ea313c6e6b74d1e6cc47aad70d3a4f127bbde5d4462a19355ed49f4026c0904d38927a37f691fc962a0fa6971c6bd6e878d51f9d'
            '7696a6874d17957f99452452723ae1a6b32b6814b018361a71ed1fe0191e1c6da6f3ad693e2e279615e74f687c380ff2f6dab8b69fcd82476e8f33b56a6b4cb5'
            '1839542bec928c14e9de4b4cb5e986767983f0b8ce51429d718eabdd459b7865abfd7793555fb8727642b3a4ff77d787e5f07370040025b3bc0c8a7b883cf052'
            'e8da9afa03d2b8feabef60f49df30d4dfe95654aa7172d62c6121985b715a71a92e5e65e4c03fc87d1c6269c1c83f610bc77999c935c026144b16e348300ea77')

package() {
  _dest="$pkgdir"/usr/lib/zulip-desktop
  mkdir -p $_dest
  unzip -d $_dest Zulip-$pkgver-linux-x64.zip

  mkdir "$pkgdir"/usr/bin
  ln -s /usr/lib/zulip-desktop/zulip "$pkgdir"/usr/bin/zulip

  install -Dm 644 zulip.desktop -t "$pkgdir"/usr/share/applications
  install -Dm 644 zulip.png -t "$pkgdir"/usr/share/pixmaps

  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/zulip-desktop
}
