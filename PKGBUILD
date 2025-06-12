# Maintainer: Philipp Hentschel  <aur[at]trsk[dot]cc>

pkgname=dbusevents
pkgver=0.1.1
pkgrel=0
pkgdesc='Small tool to react on dbus signals'
url='https://github.com/findus/dbusevents'
arch=('x86_64')
license=('MIT')
makedepends=('rust')
depends=('dbus')
source=(https://github.com/findus/dbusevents/archive/refs/tags/${pkgver}.tar.gz)
md5sums=('b6669ae19791ea318cea93e07d97939a')
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
