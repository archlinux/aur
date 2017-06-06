# Maintainer: Ricardo (XenGi) Band <email@ricardo.band>

pkgname=0xff
pkgver=1.1.0
pkgrel=2
pkgdesc="Simple http(s) file sharing tool. Think 'python -m http.server' but better."
arch=('any')
url='https://github.com/xengi/0xff'
license=('MIT')
source=("git+https://github.com/XenGi/0xff#tag=v${pkgver}")
sha256sums=('SKIP')
install='0xff.install'
makedepends=('go')

build() {
  cd "${srcdir}/${pkgname}"
  go get -u github.com/labstack/echo/...
  go get -u github.com/peterbourgon/diskv
  go get -u github.com/satori/go.uuid
  go build 0xff.go
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm 755 0xff "${pkgdir}/usr/bin/0xff"
  install -Dm 644 ../../nginx.conf "${pkgdir}/usr/share/0xff/nginx.conf"
  install -Dm 644 ../../0xff.service "${pkgdir}/usr/lib/systemd/system/0xff.service"
}
