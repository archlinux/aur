# Maintainer: Roman Vishnevsky <aka [dot] x0x01 [at] gmail [dot] com>
# Maintainer: Erikas Rudinskas <erikmnkl@gmail.com>

pkgname=blocky-bin
pkgver=0.26.2
pkgrel=2
pkgdesc='Fast and lightweight DNS proxy as ad-blocker'
arch=('x86_64' 'aarch64' 'armv7h' 'armv6h')
url='https://github.com/0xERR0R/blocky'
license=('Apache')
provides=('blocky')
backup=('etc/blocky/blocky.yml')
source=('blocky.yml'
        'blocky.service'
        'blocky.sysusers')

source_x86_64=(	"https://github.com/0xERR0R/blocky/releases/download/v${pkgver}/blocky_v${pkgver}_Linux_x86_64.tar.gz")
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
b2sums_x86_64=('c8364c53dc71e6d76b5986f6ea684c8f3875ce44477e3f0430e56d3511bd2249a9fb48a841ded0c6f2bdebbf21055ff30c95dd06f1e8a1aacbb64d62e47e95e2')
b2sums_aarch64=('12c263ddbb661c6a954ae1957f9df25cda533cc26c9d33f2199db39951fb39f6861ea62c03e9bca69d341874e0c5acb6928e297e4454b00f0a21d838ec44cfbf')
b2sums_armv7h=('9741f3fdd075ac02c8a2081a46d403ea9b8481191b16167d51b5e72b690bf7c8198648b98b1e3fdee6a322a7a1247517488050466c65587da292aaccbbf836da')
b2sums_armv6h=('d6d58231ed950d5a8c6db1f1ed714167b3651fd3590b9acb7a6c80134bf58367e403587d8f05e485b062d1a8017f0ec563059738a56270eae1df514bcb449308')

package() {
        cd "$src"
	#install -Dm 755 "blocky_v${pkgver}_linux_${_CARCH}" "$pkgdir"/usr/bin/blocky
	install -Dm 755 blocky "$pkgdir"/usr/bin/blocky
        install -Dm 644 blocky.yml "$pkgdir"/etc/blocky/blocky.yml
        install -Dm 644 blocky.service "$pkgdir"/usr/lib/systemd/system/blocky.service
        install -Dm 644 blocky.sysusers "$pkgdir"/usr/lib/sysusers.d/blocky.conf
}
