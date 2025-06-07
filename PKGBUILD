# Maintainer: Philipp Hentschel  <aur[at]trsk[dot]cc>

pkgname=dbusevents
pkgver=0.0.9
pkgrel=0
pkgdesc='Small tool to react on dbus signals'
url='https://github.com/findus/dbusevents'
arch=('x86_64')
license=('MIT')
makedepends=('rust')
depends=('dbus')
source=(https://github.com/findus/dbusevents/archive/refs/tags/${pkgver}.tar.gz)
md5sums=('08a519d0c89bc9d2cb66027987eb2129')
install='btevents.install'
validpgpkeys=('61FFD901BD7C555A8888B7D078F2B0F63DDC9CBC')

build() {
  cd ${pkgname}-${pkgver}
  cargo build --release --locked
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  echo $(pwd)
  install -Dm755 target/release/dbusevents -t "${pkgdir}/usr/bin"
  install -Dm755 target/release/dbusbtinfo -t "${pkgdir}/usr/bin"
  install -Dm755 contrib/dbusevents.service -t "${pkgdir}/etc/systemd/user"
}
