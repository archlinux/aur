# Maintainer: ntr5uki <hzy_bme@pku.edu.cn>

pkgname=mihomo-webui-config
pkgver=0.1.0
pkgrel=15
pkgdesc="Mihomo and MetaCubeXD integration with safe subscription updates"
arch=('any')
url="https://github.com/ntr5uki/mihomo-config-setup"
license=('MIT')

depends=(
  'mihomo-bin'
  'metacubexd-bin'
  'clash-geoip'
  'python'
  'python-yaml'
  'sudo'
)

install=mihomo-webui-config.install

source=(
  'LICENSE'
  'mihomo-subscription'
  'mihomo-webui-setup'
  'config.base.yaml'
  'subscriptions.example.yaml'
  'secrets.env.example'
  'mihomo-subscription-update.service'
  'mihomo-subscription-update.timer'
  'mihomo-webui.conf'
)
sha256sums=('5d0b23f5be4daaf82ce9c9ff07f371065c62c61b69d34d2c1ad73022b18ddcd2'
            '82068b54f3cffb632771c8499fed170dd643cbb126ef4a09b7f890f8385cbfb3'
            'c7c4b7bf7b51a54ea08084bbba542fad2a8a0ea2ae6623a017331ba22e7ac646'
            '04532f379120f1e36de101dc5fccac934816ac52397e71c9a88d70c342bc157e'
            '63a6f538b9b05d6830c741afe309f1e20ed55b5a7357d206d4fc3d68620c4e78'
            '27d2654ebd1699218b5a110b858b8d0325e37f4d328b47a8fae39e0668a24e03'
            '7f2779bdb39ad7e247eaebaba530ec94adf35cce20080b7adce678f5579154cd'
            '8eb6ed809c04224b065b65b2458b60a6e60abcc0f2e1d9cbd168f091963e95d7'
            '74ef8f96495a89ba648058d0a45f1cfb6253f3f7f74a3c426474b1a9a61e680a')

package() {
  install -Dm755 \
    "$srcdir/mihomo-webui-setup" \
    "$pkgdir/usr/bin/mihomo-webui-setup"

  install -Dm755 \
    "$srcdir/mihomo-subscription" \
    "$pkgdir/usr/bin/mihomo-subscription"

  install -Dm644 \
    "$srcdir/config.base.yaml" \
    "$pkgdir/usr/share/$pkgname/config.base.yaml"

  install -Dm644 \
    "$srcdir/subscriptions.example.yaml" \
    "$pkgdir/usr/share/$pkgname/subscriptions.example.yaml"

  install -Dm644 \
    "$srcdir/secrets.env.example" \
    "$pkgdir/usr/share/$pkgname/secrets.env.example"

  install -Dm644 \
    "$srcdir/mihomo-subscription-update.service" \
    "$pkgdir/usr/lib/systemd/system/mihomo-subscription-update.service"

  install -Dm644 \
    "$srcdir/mihomo-subscription-update.timer" \
    "$pkgdir/usr/lib/systemd/system/mihomo-subscription-update.timer"

  install -Dm644 \
    "$srcdir/mihomo-webui.conf" \
    "$pkgdir/usr/lib/systemd/system/mihomo.service.d/10-webui.conf"

  install -dm755 "$pkgdir/etc/mihomo"
  ln -s /etc/clash/Country.mmdb "$pkgdir/etc/mihomo/Country.mmdb"

  install -Dm644 \
    "$srcdir/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
