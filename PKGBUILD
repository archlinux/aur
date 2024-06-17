# Maintainer: Jeremy Kescher <jeremy@kescher.at>

pkgname=hellpot-bin
_targetname=hellpot
pkgver=0.4.5
pkgrel=1
_srcname=HellPot-$pkgver
pkgdesc="HellPot is a portal to endless suffering meant to punish unruly HTTP bots. (Bin version)"
arch=('x86_64' 'aarch64')
url="https://github.com/yunginnanet/HellPot"
license=('MIT')
provides=('hellpot')
conflicts=('hellpot')
source=(
    "service"
    "tmpfiles"
    "sysusers"
    "config.toml"
)
source_x86_64=("$_targetname::https://github.com/yunginnanet/HellPot/releases/download/v${pkgver}/HellPot-v${pkgver}-linux-amd64")
source_aarch64=("$_targetname::https://github.com/yunginnanet/HellPot/releases/download/v${pkgver}/HellPot-v${pkgver}-linux-arm64")
backup=('etc/hellpot/config.toml')
sha256sums=('0136fd65b73e678d12ddff09cd5f71bfea360787cf7955770fe95b64dabe8274'
            'a370bd1f4f1caa1aa4777e3a6cb6c752f711721c9913e09c78a11d304bc53b37'
            'd462d4a84021cb2ce0052ba6c46ad0ea6e7aab7a9459d048de892d8503a99aee'
            '5663856679a38a69572683f9720c4a20aeaf3eb6a26f5ca067e23d4fcc2b28ac')
sha256sums_x86_64=('cb777e9deaa2e23c575308a575cff790f8e8d37b0772aae74d696aad3822cc20')
sha256sums_aarch64=('b25049a4cbda5da5c3edc10fb0a91818761edf06ad9908969dcd1eb0015c0e52')

package() {
  cd "$srcdir"

  install -Dm755 $_targetname "${pkgdir}"/usr/bin/$_targetname
  install -Dm644 config.toml "${pkgdir}"/etc/$_targetname/config.toml
  install -Dm644 service "${pkgdir}"/usr/lib/systemd/system/$_targetname.service
  install -Dm644 tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/$_targetname.conf
  install -Dm644 sysusers "${pkgdir}"/usr/lib/sysusers.d/$_targetname.conf
}
