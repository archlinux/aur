# Maintainer: Jonas DOREL <jonas at dorel dot me>
pkgname=systemd-timer-pacman-download-updates-git
pkgver=latest
pkgrel=1
pkgdesc="Systemd timer to download packages updates"
arch=('any')
url="https://gitlab.com/jdorel-archlinux/systemd-pacman-download-updates"
license=('GPL')
depends=('systemd-service-pacman-download-updates')
makedepends=('git')
provides=('systemd-timer-pacman-download-updates')
source=("${pkgname}::git+https://gitlab.com/jdorel-archlinux/systemd-pacman-download-updates")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  #printf "latest"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "$pkgname"

	install -Dm 644 pacman-download-updates.timer "$pkgdir/usr/lib/systemd/system/pacman-download-updates.timer"
}
