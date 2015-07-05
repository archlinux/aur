# Maintainer: Chipster Julien <julien dot chipster @ archlinux dot fr>

pkgname=sshd_autoban
pkgver=0.3
pkgrel=5
pkgdesc="A ssh autoban for fast and slow brute force attack"
arch=('any')
url="https://github.com/Chipsterjulien/go-sshd_autoban"
license=('WTFPL')
makedepends=('go')
options=('!strip' '!emptydirs')
backup=('etc/sshd_autoban/sshd_autoban.json')
source=("$pkgname-$pkgver.tar.gz")
install=sshd_autoban.install
sha256sums=('0c26a63db2985ff65f52e3dde178a947ceab0a5f5c99bc18948616c630146e10')

build() {
  cd "$pkgname-$pkgver"

  go build
}

package() {
  cd "$pkgname-$pkgver"
  	
	# Create directory and copy files
	install -Dm644 "cfg/sshd_autoban.json" "$pkgdir/etc/sshd_autoban/sshd_autoban.json"
	install -Dm644 "cfg/sshd_autoban.service" "$pkgdir/usr/lib/systemd/system/sshd_autoban.service"
	install -Dm644 "cfg/errors.log" "$pkgdir/var/log/sshd_autoban/errors.log"
  
  # install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$pkgname"
  # install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  
  install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/sshd_autoban"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/sshd_autoban/LICENSE"
}

# vim:set ts=2 sw=2 et:
