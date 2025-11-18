# Maintainer: Roman Vishnevsky <aka [dot] x0x01 [at] gmail [dot] com>
# Maintainer: Erikas Rudinskas <erikmnkl@gmail.com>

pkgname=blocky-bin
pkgver=0.28.2
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
b2sums_x86_64=('347a8e92a447aa47944268f70cac80dc9a0f5ac4b1d76682c6c0b31385cb9b60e19cee0dbd0e6c20854b7dd081f07ef147e51ffe4c6e270518ba6e9b15dab88f')
b2sums_aarch64=('27083ec2a900465e70ad236b12640ecf1b810b2afe6a675a9a755cd0b7c3226eb868e5f619285cfabe69ac2e5b6ae756a089ea96b13f3a6b204d3cec49fec1ef')
b2sums_armv7h=('949a91a97c9636196e64084507ba799be202becdf1e25a18397205580998b7a478a713c2d7fda5fecb8b984bab726eefd317aaf8c8556e1f51a720fdf956863d')
b2sums_armv6h=('0f91842044f4cb320199cc4215dededf5120f72b0e8d8d3cdfaee9e2b273e8fbe613eb72255b5b054b2a125a370eaaa5f72ec0b7a975fff01cf76bf19cae89cc')

package() {
  cd "$srcdir"
  install -Dm 755 blocky "$pkgdir"/usr/bin/blocky
  install -Dm 644 blocky.yml "$pkgdir"/etc/blocky/blocky.yml
  install -Dm 644 blocky.service "$pkgdir"/usr/lib/systemd/system/blocky.service
  install -Dm 644 blocky.sysusers "$pkgdir"/usr/lib/sysusers.d/blocky.conf
}
