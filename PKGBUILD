# Maintainer: Jonas DOREL <jonas at dorel dot me>
pkgname=systemd-service-pacman-download-updates-git
pkgver=latest
pkgrel=1
pkgdesc="Systemd service to download packages updates"
arch=('any')
url="https://gitlab.com/jdorel-archlinux/systemd-pacman-download-updates"
license=('GPL')
makedepends=('git')
provides=('systemd-service-pacman-download-updates')
source=("${pkgname}::git+https://gitlab.com/jdorel-archlinux/systemd-pacman-download-updates")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  #printf "latest"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "$pkgname"

	install -Dm 644 pacman-download-updates.service "$pkgdir/usr/lib/systemd/system/pacman-download-updates.service"
}
