# Maintainer: Mikołaj Baranowski <mikolajb@gmail.com>

pkgname=gitfetch
pkgver=0.1.r0.g4a3fb80
pkgrel=1
pkgdesc='Gitfetch performs git featch on multiple repositories, can be used as a daemon'
license=('MIT')
arch=('x86_64' 'i686')
url='https://github.com/mikolajb/gitfetch'
depends=()
makedepends=('go')
source=("${pkgname}::git+http://github.com/mikolajb/gitfetch")
sha256sums=('SKIP')

pkgver() {
  cd ${srcdir}/${pkgname}/
  git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  msg2 'Compiling...'

  cd ${srcdir}/${pkgname}/
  GOPATH="$GOPATH:$srcdir" go build -o gitfetch
}

package() {
  msg2 'Installing...'

  install -Dm755 ${srcdir}/${pkgname}/gitfetch ${pkgdir}/usr/bin/gitfetch
  install -Dm644 ${srcdir}/${pkgname}/gitfetch.service ${pkgdir}/usr/lib/systemd/user/gitfetch.service
  install -Dm644 ${srcdir}/${pkgname}/gitfetch.timer ${pkgdir}/usr/lib/systemd/user/gitfetch.timer
}
