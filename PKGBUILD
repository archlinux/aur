# Maintainer: Primalmotion <primalmotion at pm dot me>

pkgname=battctl-git
pkgdesc="Battery charging thresold control and deamon. Mostly for Librem 14 laptops"
url="https://github.com/primalmotion/battctl"
pkgver=0.0.3.r0.g081b86b
pkgrel=1
license=(GPL3)
arch=(any)
depends=(systemd)
makedepends=(go)
source=("${pkgname}::git+${url}")
sha1sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${pkgname}"
	go build -trimpath
}

package() {
	mkdir -p "${pkgdir}/var/lib/battctl"
	mkdir -p "${pkgdir}/etc/battctl"

	install -Dm644 ${srcdir}/${pkgname}/dist/battctl.service ${pkgdir}/usr/lib/systemd/system/battctl.service
	install -Dm644 ${srcdir}/${pkgname}/dist/conf.yaml ${pkgdir}/etc/battctl/conf.yaml
	install -Dm755 ${srcdir}/${pkgname}/battctl ${pkgdir}/usr/bin/battctl
}
