# Maintainer: NEOAPPS <asd22.info@gmail.com>
# Co-Maintainer: TheOddCell <rayfb.to.1@gmail.com>
pkgname=plugind-git
pkgver=r2.28b008c
pkgrel=1
pkgdesc="ObsidianOS Plugin Daemon - A daemon that manages and triggers plugins on various events."
arch=('any')
url="https://github.com/Obsidian-OS/plugind"
license=('MIT')
depends=('obsidianctl' 'glibc' 'bash' 'grep' 'awk')
makedepends=('git' 'cargo' 'rust')
provides=('plugind' 'pluginctl')
source=("$pkgname::git+$url")
sha256sums=('SKIP')
pkgver() {
  cd "$srcdir/$pkgname"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 target/release/plugind "$pkgdir/usr/bin/plugind"
  install -Dm755 target/release/pluginctl "$pkgdir/usr/bin/pluginctl"
  install -Dm644 plugind.service "$pkgdir/usr/lib/systemd/system/plugind.service"
  echo "[LOG] Dont forget to systemctl enable plugind!"
}
