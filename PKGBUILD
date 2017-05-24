# Maintainer: Tony G. <aur at tonyskapunk dot net>

pkgname='scaleft-server-tools'
pkgdesc='ScaleFT(TM) daemon and shell'
pkgver=1.25.4
pkgrel=1
arch=('x86_64')
url="https://scaleft.com"
license=('custom')
install=${pkgname}.install
makedepends=('rpmextract')
depends=('glibc')
source=("https://pkg.scaleft.com/rpm/${pkgname}-${pkgver}-${pkgrel}.${arch}.rpm")
sha256sums=('bc8a119822aa8ea432a39e43e15f91004d25813c1bc17ad5b4cafd246a3b7b4f')

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
