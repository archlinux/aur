# Maintainer: TheOddCell <rayfb.to.1@gmail.com>
pkgname=obos-genissue-git
pkgver=r10.ae79abe
pkgrel=1
pkgdesc="Generate /run/issue dynamically for obsidianOS"
arch=('x86_64')
url="https://github.com/obsidian-os/obos-genissue"
license=('MIT')
depends=('bash' 'obsidianctl')
makedepends=('git')
source=("git+https://github.com/obsidian-os/obos-genissue.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/obos-genissue"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/obos-genissue"
  install -Dm755 obos-genissue "$pkgdir/usr/bin/obos-genissue"
  install -Dm644 obos-genissue.timer "$pkgdir/usr/lib/systemd/system/obos-genissue.timer"
  install -Dm644 obos-genissue.service "$pkgdir/usr/lib/systemd/system/obos-genissue.service"
  install -Dm644 issue.conf "$pkgdir/etc/systemd/system/getty@.service.d/issue.conf"
}
