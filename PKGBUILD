# Maintainer: Roman Vishnevsky <aka [dot] x0x01 [at] gmail [dot] com>
# Maintainer: Erikas Rudinskas <erikmnkl@gmail.com>

pkgname=blocky-bin
pkgver=0.28.0
pkgrel=3
pkgdesc='Fast and lightweight DNS proxy as ad-blocker'
arch=('x86_64' 'aarch64' 'armv7h' 'armv6h')
url='https://github.com/0xERR0R/blocky'
license=('Apache')
provides=('blocky')
backup=('etc/blocky/blocky.yml')
source=('blocky.yml'
  'blocky.service'
  'blocky.sysusers')

source_x86_64=("https://github.com/0xERR0R/blocky/releases/download/v${pkgver}/blocky_v${pkgver}_Linux_x86_64.tar.gz")
source_aarch64=("https://github.com/0xERR0R/blocky/releases/download/v${pkgver}/blocky_v${pkgver}_Linux_arm64.tar.gz")
source_armv6h=("https://github.com/0xERR0R/blocky/releases/download/v${pkgver}/blocky_v${pkgver}_Linux_armv6.tar.gz")
source_armv7h=("https://github.com/0xERR0R/blocky/releases/download/v${pkgver}/blocky_v${pkgver}_Linux_armv7.tar.gz")

case "$CARCH" in
x86_64) _CARCH=amd64 ;;
i686) _CARCH=386 ;;
arm) _CARCH=arm5 ;;
armv7h) _CARCH=arm7 ;;
aarch64) _CARCH=arm64 ;;
*) return 1 ;;
esac

b2sums=('39ad1c530ea0abc3d166880c2e8cc6b1dd266531a131bef8cd5a5ea0208b4d361f3e98d07a8b26af8517cddb34cbfadc37ae175337befa673f073ae744f40633'
        '15786ea9006210df1e65dfe91e535a0cacaf57ff6c8068169cd5d09630d939a112dda0a4bdb0c963d0c3748472bf0656ea053227a56b972a3dc23ae2298d5fa4'
        '9641b73253d80a8f64fdd1c10a35ae7631e9eec8d2feda3214836af7634fc0d33d55a5b150912996b3380ef9242b17fbb2a847557b68bf5b657da68eb7d8321c')
b2sums_x86_64=('28656de74066af61e5b028414b4e9360c8f68a192a3935d858aefc37aa57af4b49277d17e2b64f0ead21e635dd7a3d9e5adda07d360acae520966808a16681c4')
b2sums_aarch64=('e7d7a98d0d391f519b7a8c669869294f6db13a6d01a649d295fd28c64370a0a7d8eb9a5bf4c23e08b9ad03f3866dd76ebad15aa09185b8f87667eb09aa4e95f2')
b2sums_armv7h=('7ea66f142fa581aa6af1bca97e1c870d778c2e684e9bb770017ff807c8a994f00df9207567615f9cb16fe3305d258df32e913212c38ea78971e5d1514ac408d8')
b2sums_armv6h=('9272118fda0954a4a892ec87b383d4587aaa3c8faf1ddce2beefb6556d01d1fc6cba9296e7dc9cf90d72c3fc19e21623c06b647d3fa98ced46dcf2dfbebeec21')

package() {
  cd "$srcdir"
  install -Dm 755 blocky "$pkgdir"/usr/bin/blocky
  install -Dm 644 blocky.yml "$pkgdir"/etc/blocky/blocky.yml
  install -Dm 644 blocky.service "$pkgdir"/usr/lib/systemd/system/blocky.service
  install -Dm 644 blocky.sysusers "$pkgdir"/usr/lib/sysusers.d/blocky.conf
}
