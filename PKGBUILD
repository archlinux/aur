# Maintainer: Joe Balough <scallopedllama@gmail.com>
pkgname=easel-driver-docker-git
pkgver=1.0.r0.g2da5444
pkgrel=1
pkgdesc="Driver used to communicate between Easel and X-Carve or Carvey, run in Docker when device is connected"
arch=('any')
url="https://gitlab.com/scallopedllama/easel-driver-docker"
license=('GPL2')
depends=('docker>=1:20.10.6-1')
source=('easel-driver-docker::git+https://gitlab.com/scallopedllama/easel-driver-docker.git#branch=main')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/easel-driver-docker"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "$srcdir/easel-driver-docker/host"
	install -m 755 -d "$pkgdir/etc/udev/rules.d"
	install -m 755 -d "$pkgdir/usr/lib/systemd/system/"
	install -m 644 99-easel.rules "$pkgdir/etc/udev/rules.d"
	install -m 644 easel-driver.service "$pkgdir/usr/lib/systemd/system/"
}
