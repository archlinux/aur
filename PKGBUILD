# Maintainer: Joakim Repomaa <aur@j.repomaa.com>

pkgname=autopass.cr
pkgver=0.2.0
pkgrel=1
pkgdesc='a rofi frontend for pass'
arch=(x86_64)
url='https://gitlab.com/repomaa/autopass.cr'
license=('MIT')
depends=(pass rofi xdotool gpgme gc libyaml libevent)
makedepends=(crystal shards rust git python)

source=(
  "https://gitlab.com/repomaa/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz"
  "https://gitlab.com/repomaa/autopass.cr/uploads/52cc5f7f2ff2f2e492e054eb29930e8f/autopass.cr-v0.2.0.tar.gz.sig"
)
md5sums=(
  470db1b54a4d846e55ce941022e87bf5
  SKIP
)
validpgpkeys=(CC7BD43A315EBC373F9A1F2EEFEB16CB1C8952C5)
provides=('autopass')
conflicts=('autopass', 'autopass.cr-git', 'autopass.cr-bin')
optdepends=('passed-git: batch editing of pass entries with sed')

build() {
  cd "${pkgname}-v${pkgver}"
  shards build --release
}

package() {
  cd "${pkgname}-v${pkgver}"
  install -Dm755 bin/autopass "$pkgdir/usr/bin/autopass"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
