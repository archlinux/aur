# Maintainer: mutantmonkey <aur@mutantmonkey.mx>
pkgname=filtor
pkgver=27.9fdfa5b
pkgrel=1
pkgdesc="A whitelisting proxy for the Tor control port."
arch=('any')
url="https://github.com/mutantmonkey/filtor"
license=('WTFPL')
depends=('python' 'tor')
makedepends=('git')
conflicts=('tor-control-port-proxy')
replaces=('tor-control-port-proxy')
install=${pkgname}.install
source=('git+https://github.com/mutantmonkey/filtor.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/filtor"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

package() {
  cd "$srcdir/filtor"
  install -Dm755 filtor \
    "${pkgdir}/usr/bin/filtor"
  install -Dm644 filtor.service \
    "${pkgdir}/usr/lib/systemd/system/filtor.service"
  install -Dm644 COPYING \
    "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

# vim:set ts=2 sw=2 et:
