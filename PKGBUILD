# Maintainer: Roman Vishnevsky <aka [dot] x0x01 [at] gmail [dot] com>
# Maintainer: Erikas Rudinskas <erikmnkl@gmail.com>

pkgname=blocky-bin
pkgver=0.20
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

source_x86_64=(	"https://github.com/0xERR0R/blocky/releases/download/v${pkgver}/blocky_${pkgver}_Linux_x86_64.tar.gz")
source_aarch64=("https://github.com/0xERR0R/blocky/releases/download/v${pkgver}/blocky_${pkgver}_Linux_arm64.tar.gz")
source_armv6h=("https://github.com/0xERR0R/blocky/releases/download/v${pkgver}/blocky_${pkgver}_Linux_armv6.tar.gz")
source_armv7h=("https://github.com/0xERR0R/blocky/releases/download/v${pkgver}/blocky_${pkgver}_Linux_armv7.tar.gz")

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
b2sums_x86_64=('a9025e51eada56551bd6d5b574d18dce25a6b8a992d6f78a8f2dbbf1bfab183f22e2a969e380c360cdef556daaac5ec170862286f079cadd4d620526f9885eb5')
b2sums_aarch64=('6770ed34c61dffe7eae850f5c90a64b0613a32f9e053e75e3d5a0d5fb43830c45e2f02c5bdcff31015b2bd68204fbdb810ab4c5eade5ccdb14aab45bfe853a3d')
b2sums_armv7h=('d2540ec012bc7106e23b51b5ab70d95c0bd199e1737df322712a40007f0b04a7274454f523378c1a6c19fa028260ee0bcc0a857b05a3de492fa1b194f5f89a82')
b2sums_armv6h=('64219107e86665f4a23918721caac1df90a5e2d678ea1db08541d632a0655315851f4fbb441aa5b859b4489526ead6a55b1c2d5b926213d38a012bf9a311ca62')

package() {
        cd "$src"
	#install -Dm 755 "blocky_v${pkgver}_linux_${_CARCH}" "$pkgdir"/usr/bin/blocky
	install -Dm 755 blocky "$pkgdir"/usr/bin/blocky
        install -Dm 644 blocky.yml "$pkgdir"/etc/blocky/blocky.yml
        install -Dm 644 blocky.service "$pkgdir"/usr/lib/systemd/system/blocky.service
        install -Dm 644 blocky.sysusers "$pkgdir"/usr/lib/sysusers.d/blocky.conf
}
