# Maintainer: Joakim Repomaa <aur@j.repomaa.com>

pkgname=autopass.cr
pkgver=0.2.2
pkgrel=1
pkgdesc='a rofi frontend for pass'
arch=(x86_64)
url='https://gitlab.com/repomaa/autopass.cr'
license=('MIT')
depends=(pass rofi xdotool gpgme gc libyaml libevent)
makedepends=(crystal shards rust git python)

source=(
  'https://gitlab.com/repomaa/autopass.cr//uploads/ef41eabeca18c38439ecda45ebd198d4/autopass.cr-v0.2.2.tar.gz'
  'https://gitlab.com/repomaa/autopass.cr//uploads/a9f00047a3bcb06e832f30e221ea5fcd/autopass.cr-v0.2.2.tar.gz.sig'
  'autopass.socket'
  'autopass.service'
)
md5sums=(
  86dcbd460c13690e07f2871a142207cd
  SKIP
  SKIP
  SKIP
)
validpgpkeys=(CC7BD43A315EBC373F9A1F2EEFEB16CB1C8952C5)
provides=('autopass')
conflicts=('autopass' 'autopass.cr-git' 'autopass.cr-bin')
optdepends=('passed-git: batch editing of pass entries with sed')

build() {
  cd "${pkgname}-v${pkgver}"
  shards build --release
}

package() {
  cd "${pkgname}-v${pkgver}"
  install -Dm755 bin/autopass "$pkgdir/usr/bin/autopass"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 autopass.socket "$pkgdir/usr/lib/systemd/user/autopass.socket"
  install -Dm644 autopass.service "$pkgdir/usr/lib/systemd/user/autopass.service"
}

# vim:set ts=2 sw=2 et:
