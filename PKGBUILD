# Maintainer: Roman Vishnevsky <aka [dot] x0x01 [at] gmail [dot] com>
# Maintainer: Erikas Rudinskas <erikmnkl@gmail.com>

pkgname=blocky-bin
pkgver=0.15
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
b2sums_x86_64=('b31d637bf17255ca9eacd63169c25a7328ebb7b148d1588b888e08d9e0f991d763abac885338012156fefb5df5dc79a86d9200b33cda9932497579a66bc0d91d')
b2sums_aarch64=('37c9ff81131a7e418700142eb14bd393ff60f9e50a269c620084cf3cee0cfb8c9864f313cb41d56c0c7253c51bd9c330051936e0107bdf3bc4970159fe518447')
b2sums_armv7h=('3f72e9417bc96f298fb0e026a3a3a5386cf7d5b0736df7b95db4fc63418b78b785d99595da14577d80b88cb88d5c8c931fac486985c8e60170f4ab12bc827e05')
b2sums_armv6h=('23f3cc3b5593d486c8f72daf382df481e9bdb82946124df5730cd62acbdc504de72e482f81441293dfc8c188b73d9cf64ae7115cee6b711b41d8fc3d62820fd1')

package() {
        cd "$src"
	#install -Dm 755 "blocky_v${pkgver}_linux_${_CARCH}" "$pkgdir"/usr/bin/blocky
	install -Dm 755 blocky "$pkgdir"/usr/bin/blocky
        install -Dm 644 blocky.yml "$pkgdir"/etc/blocky/blocky.yml
        install -Dm 644 blocky.service "$pkgdir"/usr/lib/systemd/system/blocky.service
        install -Dm 644 blocky.sysusers "$pkgdir"/usr/lib/sysusers.d/blocky.conf
}
