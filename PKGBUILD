# Maintainer: Philipp Hentschel  <aur[at]trsk[dot]cc>

pkgname=dbusevents
pkgver=0.0.6
pkgrel=0
pkgdesc='Small tool to react on dbus signals'
url='https://github.com/findus/dbusevents'
arch=('x86_64')
license=('MIT')
makedepends=('rust')
depends=('dbus')
source=(https://codeload.github.com/findus/dbusevents/tar.gz/refs/tags/${pkgver})
md5sums=('58f106eaa95ed366d96479cd0450b546')
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
