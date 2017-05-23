# Maintainer: Tony G. <aur at tonyskapunk dot net>

pkgname='scaleft-server-tools'
pkgdesc='ScaleFT(TM) daemon and shell'
pkgver=1.25.3
pkgrel=1
arch=('x86_64')
url="https://scaleft.com"
license=('custom')
install=${pkgname}.install
makedepends=('rpmextract')
depends=('glibc')
source=("https://pkg.scaleft.com/rpm/${pkgname}-${pkgver}-${pkgrel}.${arch}.rpm")
sha256sums=('43662e088a8e1530be67618fbaf60ea94e2ce2444a3c5d8014287b23f9a844d8')

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
