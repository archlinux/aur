# Maintainer: Roman Vishnevsky <aka [dot] x0x01 [at] gmail [dot] com>
# Maintainer: Erikas Rudinskas <erikmnkl@gmail.com>

pkgname=blocky-bin
pkgver=0.24
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
b2sums_x86_64=('3e1a37f0f34bd959eda5abf82d85321056e66280c0dab67ddc28794d81a9e11e1c7b54a46fa9a166e041752c82a79541a65fe9a8ef5161992ee64b42c4465f91')
b2sums_aarch64=('cf808ea08f203773b66f2b7bc28964d2e4d733851169c917e90fe192c30ddbe898e14d74ae47bda9a9b13bc4d173eee0f9f04b8b52974a78a83fab9f83178180')
b2sums_armv7h=('caee165cfd86d21df83d96496587ef74d757e2e90b97a6bc91bceb2a4a3dc80a88cbc591821eff4d712ad238e43262319446542e3a64bec445c6625c7e73d062')
b2sums_armv6h=('665a416901f98b431cacd5416c4c759cb4eebe3a78b7b3c185b4d0979e185fc3b663c12ce3a9b968e6eab6f6675bf6da306326c6cb4dd1097f562952d8040138')

package() {
        cd "$src"
	#install -Dm 755 "blocky_v${pkgver}_linux_${_CARCH}" "$pkgdir"/usr/bin/blocky
	install -Dm 755 blocky "$pkgdir"/usr/bin/blocky
        install -Dm 644 blocky.yml "$pkgdir"/etc/blocky/blocky.yml
        install -Dm 644 blocky.service "$pkgdir"/usr/lib/systemd/system/blocky.service
        install -Dm 644 blocky.sysusers "$pkgdir"/usr/lib/sysusers.d/blocky.conf
}
