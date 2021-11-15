# Maintainer: Roman Vishnevsky <aka [dot] x0x01 [at] gmail [dot] com>
# Maintainer: Erikas Rudinskas <erikmnkl@gmail.com>

pkgname=blocky-bin
pkgver=0.17
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
b2sums_x86_64=('ca18b9dcd88aa17b14a90bea4fa459cd4484b102de87566af57276dc64d3493944552a6c1bfc03a5da99a3bb3dec48cc75460e0a60f512580240948f7075be78')
b2sums_aarch64=('e19de3e14397449f17553c86dbf7d928828dcb5b23adb2af1aa674225a4ddf4378de014dd157655cfabb166ba90e7e977cdba81c80df2ac38b7820d95496b42a')
b2sums_armv7h=('b8b5c68706ce64fa4d7e1c172b5f8e991199b84608db747c4cb694ca0963beec5e73faabc365a86c67433a0ce253a872c5ea7863834eff463be9acbb0fa9ece6')
b2sums_armv6h=('e31d0f888bb324793852df5e77f4cda08f03787c2c8b4e3bbe7442034543f6068bf29826373d718faadf8e3d6c98cd49e1b662edbfd3398a5e2b05945af0ebde')

package() {
        cd "$src"
	#install -Dm 755 "blocky_v${pkgver}_linux_${_CARCH}" "$pkgdir"/usr/bin/blocky
	install -Dm 755 blocky "$pkgdir"/usr/bin/blocky
        install -Dm 644 blocky.yml "$pkgdir"/etc/blocky/blocky.yml
        install -Dm 644 blocky.service "$pkgdir"/usr/lib/systemd/system/blocky.service
        install -Dm 644 blocky.sysusers "$pkgdir"/usr/lib/sysusers.d/blocky.conf
}
