# Maintainer: Joakim Repomaa <aur@j.repomaa.com>

pkgname=autopass.cr
pkgver=0.2.4
pkgrel=1
pkgdesc='a rofi frontend for pass'
arch=(x86_64)
url='https://gitlab.com/repomaa/autopass.cr'
license=('MIT')
depends=(pass rofi xdotool gpgme gc libyaml libevent dbus)
makedepends=(crystal shards rust git python)

source=(
  "git+https://gitlab.com/repomaa/autopass.cr?signed#tag=v${pkgver}"
)
md5sums=(
  SKIP
)
validpgpkeys=(F0AF1CE34733B22317A8937D05557F53CD3C6458)
conflicts=('autopass' 'autopass.cr-git' 'autopass.cr-bin')
optdepends=('passed-git: batch editing of pass entries with sed')

build() {
  cd "${pkgname}"
  shards build --release
}

package() {
  cd "${pkgname}"
  install -Dm755 bin/autopass "$pkgdir/usr/bin/autopass"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 autopass.socket "$pkgdir/usr/lib/systemd/user/autopass.socket"
  install -Dm644 autopass.service "$pkgdir/usr/lib/systemd/user/autopass.service"
}

# vim:set ts=2 sw=2 et:
