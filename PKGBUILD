# Maintainer: Roman Vishnevsky <aka [dot] x0x01 [at] gmail [dot] com>
# Maintainer: Erikas Rudinskas <erikmnkl@gmail.com>

pkgname=blocky-bin
pkgver=0.23
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
b2sums_x86_64=('58568b65432edb2bc90fc554844d3ac79bcaef84d71aaafb3dc56d1a37af121538ff6900c87f262a162b5fdffb0917477ce3d1eb07e9d993e597b477e5651615')
b2sums_aarch64=('55a3d5aa31c1ff86697ceb332a0b2dc389acf8d6dde5a3f4e18242dbfdf0ea70a4938290a0fd156b0cc24c7cb0ec912167c96be9ebf3706efdc3b3e1458fec73')
b2sums_armv7h=('73253395dfd23cba42b1e158c0b6b391e11ea4c6c281b4174a1a12aab819a016c461f1903fde30cbd7febc8262bfa19ad3bcd4285552fc2a9cbd05910233c225')
b2sums_armv6h=('6b7271ce97fbd31037b0fccadb0ddcdace40b2accd7dfc720441c7a890245ae66cd62fa2bdb426974c9f4e89be0fdef7fc4ffc8cb4a2b8960f43b54e83ab9957')

package() {
        cd "$src"
	#install -Dm 755 "blocky_v${pkgver}_linux_${_CARCH}" "$pkgdir"/usr/bin/blocky
	install -Dm 755 blocky "$pkgdir"/usr/bin/blocky
        install -Dm 644 blocky.yml "$pkgdir"/etc/blocky/blocky.yml
        install -Dm 644 blocky.service "$pkgdir"/usr/lib/systemd/system/blocky.service
        install -Dm 644 blocky.sysusers "$pkgdir"/usr/lib/sysusers.d/blocky.conf
}
