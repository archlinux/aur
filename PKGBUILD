pkgname=podspawn
pkgver=1.0.0
pkgrel=1
pkgdesc="Mock alternative based on OCI"
arch=('any')
url="https://github.com/zvova7890/podspawn/"
license=('MIT')
depends=('podman' 'usermode' 'systemd')
install=podspawn.install
source=(git+https://github.com/zvova7890/podspawn.git#tag=v$pkgver)
sha256sums=('SKIP')

package() {
  cd podspawn

  install -dm755 "${pkgdir}/etc/security/console.apps"
  install -dm755 "${pkgdir}/etc/pam.d"
  install -dm755 "${pkgdir}/usr/bin"

  install -Dm644 "etc/pam.d/podspawn" "${pkgdir}/etc/pam.d/podspawn"
  install -Dm644 "etc/security/console.apps/podspawn" "${pkgdir}/etc/security/console.apps/podspawn"
  install -Dm755 "podspawn.sh" "${pkgdir}/usr/bin/podspawn.sh"

  ln -s /usr/bin/consolehelper "${pkgdir}/usr/bin/podspawn"
}
