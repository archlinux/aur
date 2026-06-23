# Maintainer: Roman Vishnevsky <aka [dot] x0x01 [at] gmail [dot] com>
# Maintainer: Erikas Rudinskas <erikmnkl@gmail.com>

pkgname=blocky-bin
pkgver=0.32.1
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
b2sums_x86_64=('d9d112393a0ee6d611b33a8f0af9220cd8d52510fed6f176ea9f3d30ab72af4ce65376bbc45cdd588ec078f2b77aeb1490de0ccb39672180059e7c89e4fa94c1')
b2sums_aarch64=('afc2987b7afa1cffa81fc3ea2bdba89e91f0879e16a22460ee84bc9cc37801eb037d2fd5c32d41d355b7eda64d88b7f56785f2539f7c9f3347985a490f90438a')
b2sums_armv7h=('9a9c5def5b30e09e0065fc0bf5fa714b2197982fa0adf87b0c7be3450a20a7e275663fd92b9ae266051d7ba23e56b2e2967af6aa39812bddafd6cd9f3068eb91')
b2sums_armv6h=('5d4600038e39f339c01a0a8e5fbc739cf86cbc167a6ef5754b35ba295afb5f057ca4a86e5c6097558bd7a534d32e0557ffba36eaac8c13402162a842e6881c29')

package() {
  cd "$srcdir"
  install -Dm 755 blocky "$pkgdir"/usr/bin/blocky
  install -Dm 644 blocky.yml "$pkgdir"/etc/blocky/blocky.yml
  install -Dm 644 blocky.service "$pkgdir"/usr/lib/systemd/system/blocky.service
  install -Dm 644 blocky.sysusers "$pkgdir"/usr/lib/sysusers.d/blocky.conf
}
