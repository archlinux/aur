# Maintainer: Francisco Soto <ebobby(at)ebobby(dot)org>

pkgname=iuvolt
pkgver=45
pkgrel=1
pkgdesc="Experimental script to undervolt Intel CPUs"
arch=('any')
url="https://github.com/rigred/iuvolt"
license=('GPL')
install="${pkgname}.install"
depends=('bc' 'msr-tools')
source=(
  'iuvolt::git+https://github.com/rigred/iuvolt.git#commit=ffbe9cc2965f71b2c4923f699c919f1d99a51233'
  'iuvolt.cfg'
  )
sha1sums=(
  'SKIP'
  'SKIP'
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
