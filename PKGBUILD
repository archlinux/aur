# Maintainer: Sergey Zarechnev <da_kurlzzzzz@mail.ru>

# shellcheck disable=2034 disable=2154
pkgname=pacpac-git
pkgver=r111.e76558a
pkgrel=1
pkgdesc="Synchronize Arch packages across machines"
arch=('any')
url="https://github.com/da-kurlzzzzz/pacpac"
license=('WTFPL')
depends=('ansible' 'yq' 'sudo' 'inetutils')
makedepends=('git')

pkgver() {
  cd "$srcdir/${pkgname%-git}" || return 1
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

source=("pacpac::git+https://github.com/da-kurlzzzzz/pacpac.git")
sha256sums=('SKIP')

package() {
  cd "$srcdir/pacpac" || return 1

  install -Dm755 pacpac "$pkgdir/usr/bin/pacpac"
  install -Dm644 pacpac.yml "$pkgdir/usr/share/pacpac/pacpac.yml"
  install -Dm644 ansible.cfg "$pkgdir/usr/share/pacpac/ansible.cfg"
  install -Dm644 inventory.ini "$pkgdir/usr/share/pacpac/inventory.ini"
  install -Dm644 -t "$pkgdir/usr/share/doc/pacpac/" README.md
}

# vim: ft=sh
