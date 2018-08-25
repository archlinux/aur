# Maintainer: Francisco Soto <ebobby(at)ebobby(dot)org>

pkgname=iuvolt
pkgver=44
pkgrel=1
pkgdesc="Experimental script to undervolt Intel CPUs"
arch=('any')
url="https://github.com/tiziw/iuvolt"
license=('GPL')
install="${pkgname}.install"
depends=('bc' 'msr-tools')
source=(
  'iuvolt::git+https://github.com/tiziw/iuvolt.git#commit=5e3599798177ac16e6bab4e2ad5c81f6690481c3'
  'iuvolt.cfg'
  )
sha1sums=(
  'SKIP'
  'ed5ee6f4a93c14c28b3aa505f0d400d571db4cfe'
)

pkgver() {
  cd ${srcdir}/${pkgname}
  git rev-list --count HEAD
}

package() {
  # Install script
  install -Dm755 ${srcdir}/${pkgname}/iuvolt ${pkgdir}/usr/bin/iuvolt

  # Install systemd unit files
  install -Dm644 ${srcdir}/${pkgname}/iuvolt.service ${pkgdir}/usr/lib/systemd/system/iuvolt.service

  # Install config
  install -Dm644 ${srcdir}/iuvolt.cfg ${pkgdir}/etc/iuvolt.cfg
}
