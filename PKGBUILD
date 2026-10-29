# Maintainer: Roman Vishnevsky <aka [dot] x0x01 [at] gmail [dot] com>
# Maintainer: Erikas Rudinskas <erikmnkl@gmail.com>

pkgname=blocky-bin
pkgver=0.35.0
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
b2sums_x86_64=('89945953df7466e977517288c4824d77c3ef1adaf128caebd964233dd8f40fa812813a9622e9c27e6f13839369d3ab20e61dc35c53dd6059b39f155d5d1d5449')
b2sums_aarch64=('525bf8b76803af0ded29729028c5111cc39578d7d76d485efdf882d5427dc885f5eef81721fb7c41859c448921ca10b5d21217189bdb561f608b61ce857b8774')
b2sums_armv7h=('31408b96ddd1fd38c918b721c6ee5ac6b4a7e9a1607406c7876d2b16ae4cfb555df050122042f5e0ccf7298f569bb4412f215bc70641597cdcf16f72f5ccdf29')
b2sums_armv6h=('cc6f7a398a6ecb5b51fc6a27e589aa0fc032191079c73c8edc4debcfa5920278a2f4d8e9e02bb44ee592322ef09f4cd80e4a76af29b8ce12aef298f506b6424c')

package() {
  cd "$srcdir"
  install -Dm 755 blocky "$pkgdir"/usr/bin/blocky
  install -Dm 644 blocky.yml "$pkgdir"/etc/blocky/blocky.yml
  install -Dm 644 blocky.service "$pkgdir"/usr/lib/systemd/system/blocky.service
  install -Dm 644 blocky.sysusers "$pkgdir"/usr/lib/sysusers.d/blocky.conf
}
