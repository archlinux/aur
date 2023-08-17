# Maintainer: Roman Vishnevsky <aka [dot] x0x01 [at] gmail [dot] com>
# Maintainer: Erikas Rudinskas <erikmnkl@gmail.com>

pkgname=blocky-bin
pkgver=0.21
pkgrel=1
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

b2sums=('55648107bccfc345c3d08c3b34400338a70eb8198e57000943e7bb52f399fd8d2322cb19cac3fefc05509143ca79a653f5890a8a07fa2bdec18a9f89917b7fe9'
        'a15f32382187b47aeb72a625c3893e58f18b21e8541e7202bea10060687393a364787e4d7e698208d006f7e77caab8fe53964d8cb53c4a3e6a015a8251a47a27'
        '9641b73253d80a8f64fdd1c10a35ae7631e9eec8d2feda3214836af7634fc0d33d55a5b150912996b3380ef9242b17fbb2a847557b68bf5b657da68eb7d8321c')
b2sums_x86_64=('995b83c0dc282e65505e5151e80366561d78df619789375630364bc09e4c2ff9647cb8026949e7e6dd4d998764cfba61a560ef34f10ae8edec74e18b21ff9f92')
b2sums_aarch64=('8127c65362a2c3215c45c8c86b95ffe3ca3846f72707fb596db96f144e414e35a79173f252eeacd25198ed0f52832598bd69bcab3fedebba3aedf62e8c11edd9')
b2sums_armv7h=('a4250f732b3ca6dfcfb0856344abf71973621ad7876f7678a1fa806a7396b20df1d9eeeb6c24ea738974daf1df0846eb54dc5c2c3d65cda531ce02dfd4f1a67b')
b2sums_armv6h=('5c40415d449ca3edd8fe090e44b0bcc1641dadb643546a48f2dc7a67ae2cad6d14a7864da41893dc1ad7c626cb68cac47316598fdaa2e16ebc7fcd8df2c5b0da')

package() {
        cd "$src"
	#install -Dm 755 "blocky_v${pkgver}_linux_${_CARCH}" "$pkgdir"/usr/bin/blocky
	install -Dm 755 blocky "$pkgdir"/usr/bin/blocky
        install -Dm 644 blocky.yml "$pkgdir"/etc/blocky/blocky.yml
        install -Dm 644 blocky.service "$pkgdir"/usr/lib/systemd/system/blocky.service
        install -Dm 644 blocky.sysusers "$pkgdir"/usr/lib/sysusers.d/blocky.conf
}
