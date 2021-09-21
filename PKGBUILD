# Maintainer: Roman Vishnevsky <aka [dot] x0x01 [at] gmail [dot] com>
# Maintainer: Erikas Rudinskas <erikmnkl@gmail.com>

pkgname=blocky-bin
pkgver=0.16
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
b2sums_x86_64=('4317a0957dc004ebd867c4b3b7c4c0a8ec84231ac620d452fca96839118e52b5a50abae327155bbade1d35e8a488e935eeb38fafabfcfd47fe5126c1fe116857')
b2sums_aarch64=('9121ec6e14e1b643097248ceb6eb43ea7a7c838838839aa5d5fb277622dcc6f5bb5e688bb2cdf6cbd20ed467d373c5e7134db1080abcb7f275d286a3c347e406')
b2sums_armv7h=('bfa53a827b05e908c89b23fa0ad4d3b2a3895d35c35aaef2a936a5ff74c89caf824137b8676eac917eb946f3e07778ec73b8810a1739bb197d05b9a1ffa4f109')
b2sums_armv6h=('3dbbb49e74ffc813e0106d60f9cae0675aecde27e703404ce1b0d7a3bc8ff70ae172964070198b5c8f218337e38751eabb634929d0141ba6c6711c68737c2c3a')

package() {
        cd "$src"
	#install -Dm 755 "blocky_v${pkgver}_linux_${_CARCH}" "$pkgdir"/usr/bin/blocky
	install -Dm 755 blocky "$pkgdir"/usr/bin/blocky
        install -Dm 644 blocky.yml "$pkgdir"/etc/blocky/blocky.yml
        install -Dm 644 blocky.service "$pkgdir"/usr/lib/systemd/system/blocky.service
        install -Dm 644 blocky.sysusers "$pkgdir"/usr/lib/sysusers.d/blocky.conf
}
