# Maintainer: Tony G. <aur at tonyskapunk dot net>

pkgname='scaleft-server-tools'
pkgdesc='ScaleFT(TM) daemon and shell'
pkgver=1.26.2
pkgrel=1
arch=('x86_64')
url="https://scaleft.com"
license=('custom')
install=${pkgname}.install
makedepends=('rpmextract')
depends=('glibc')
source=("https://pkg.scaleft.com/rpm/${pkgname}-${pkgver}-${pkgrel}.${arch}.rpm")
sha256sums=('957d05dec2f8a8b62f430686fbc4e90275d1a1bc23901442f70da4fe6956d525')

prepare() {
	rpmextract.sh ${pkgname}-${pkgver}-${pkgrel}.${arch}.rpm
}

package() {
  install -Dm0644 etc/systemd/system/sftd.service \
                  ${pkgdir}/etc/systemd/system/sftd.service 
  install -Dm0755 usr/lib/scaleft-trace.so ${pkgdir}/usr/lib/scaleft-trace.so
  install -Dm0755 usr/sbin/sftd ${pkgdir}/usr/bin/sftd
  install -Dm0644 usr/share/doc/scaleft-server-tools/LICENSE.txt \
                  ${pkgdir}/share/doc/scaleft-server-tools/LICENSE.txt
}
