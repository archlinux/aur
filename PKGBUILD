# Maintainer: Joakim Repomaa <aur@j.repomaa.com>

pkgname=autopass.cr-git
pkgver=0.r4.802fb81
pkgrel=1
pkgdesc='a rofi frontend for pass'
arch=(x86_64)
url='https://gitlab.com/repomaa/autopass.cr'
license=('MIT')
depends=(pass rofi xdotool gpgme gc libyaml libevent)
makedepends=(crystal shards rust git python)

source=("${pkgname}::git+https://gitlab.com/repomaa/autopass.cr")
sha512sums=(SKIP)
provides=('autopass')
conflicts=('autopass')
optdepends=('passed-git: batch editing of pass entries with sed')

pkgver() {
  cd "${pkgname}"
  printf '0.r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname}"
  shards build --release
}

package() {
  cd "${pkgname}"
  install -d "$pkgdir/usr/bin"
  install -m755 bin/autopass "$pkgdir/usr/bin/autopass"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
