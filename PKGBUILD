# Maintainer: Kazuki Sawada <kazuki@6715.jp>

pkgname=stns
pkgver=2.1.0
pkgrel=1
pkgdesc="This server can easily manage Linux user group with TOML format setting file."
arch=('i686' 'x86_64')
url="https://github.com/STNS/STNS"
license=('MIT')
depends=()
makedepends=('go-pie')
source=("https://github.com/STNS/STNS/archive/v${pkgver}.tar.gz")
md5sums=('f7f56ee0433b44296af6813fbc7e8cd1')

package() {
  cd "${srcdir}/STNS-${pkgver}"

  patch go.sum "${startdir}/go.sum.patch"
  install -dm755 "${pkgdir}/usr/bin"
  install -dm755 "${pkgdir}/usr/lib/${pkgname}"
  make GO="GO111MODULE=on go" BINDIR="${pkgdir}/usr/bin" MODDIR="${pkgdir}/usr/lib/modules.d/${pkgname}" install

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 package/stns-v2.conf "${pkgdir}/etc/${pkgname}/server/${pkgname}.conf"
  install -Dm644 package/stns-v2.systemd "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm644 package/stns-v2.logrotate "${pkgdir}/etc/logrotate.d/${pkgname}"
}
