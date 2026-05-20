# Maintainer: Roman Vishnevsky <aka [dot] x0x01 [at] gmail [dot] com>
# Maintainer: Erikas Rudinskas <erikmnkl@gmail.com>

pkgname=blocky-bin
pkgver=0.30.0
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
b2sums_x86_64=('ff164ca48b312a63cb4c17d62cc1ffc039545946844cfa405ac852ba226fb80b47499f6a40e35ddcaeb331316fbf2391a14be57079ba993be040ad2141f1fd14')
b2sums_aarch64=('954b7efbd8f9f191aafe7893bb6270cdf74424830c435914667ac9ca337ddbaa1caffe683a163e5512136b0c70211455c4e7598a58901d0fb0df018da144aa94')
b2sums_armv7h=('e344d6628b557a13a49525c6fed16c1e00684546734b31d0a0f333c09997d03cef8f0eb8705f67969aff949b7c9c915766ddf4649db4831b2e01be84b11f80d8')
b2sums_armv6h=('47349a94b7eb2a03ae350ba366eb6f19857dd6b8795caee8a897297a1ebf41b8aaef23824ef84d60f9588a9ccbb365a077aab0e71917535b968d91578ee1a037')

package() {
  cd "$srcdir"
  install -Dm 755 blocky "$pkgdir"/usr/bin/blocky
  install -Dm 644 blocky.yml "$pkgdir"/etc/blocky/blocky.yml
  install -Dm 644 blocky.service "$pkgdir"/usr/lib/systemd/system/blocky.service
  install -Dm 644 blocky.sysusers "$pkgdir"/usr/lib/sysusers.d/blocky.conf
}
