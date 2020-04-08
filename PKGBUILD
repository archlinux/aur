# Maintainer: Steven Seifried <gitlab@canox.net>
# Contributor: Steven Seifried <gitlab@canox.net>
pkgname=tuxedo-control-center
pkgver=0.9.1
pkgrel=1
pkgdesc="An application helping you to tune your TUXEDO"
arch=(x86_64)
url="https://www.tuxedocomputers.com/"
license=('GPL')
depends=('tuxedo-cc-wmi')

source=(http://deb.tuxedocomputers.com/ubuntu/pool/main/t/tuxedo-control-center/tuxedo-control-center_0.9.1_amd64.deb)
sha256sums=('236130914ace4981486610124781d62fe64748996d24b13a5552edc84449b67d')
sha512sums=('dfb3d2f8bb66e755c82ab95d3fc220a6e2f6c5df007ecf877b658e45acc25daca3ee8869cbb5d6ea241c8a92acce95a5ddfa9c16ef804b776f6eae431e7da691')

package() {
  ar vx "${srcdir}/tuxedo-control-center_0.9.1_amd64.deb"
  tar -xf "${srcdir}/data.tar.xz"
  mkdir -p "${pkgdir}/opt/${pkgname}"
  cp -r "${srcdir}/opt/${pkgname}"/* "${pkgdir}/opt/${pkgname}"
  install -Dm644 "${srcdir}/opt/tuxedo-control-center/resources/dist/tuxedo-control-center/data/dist-data/tuxedo-control-center.desktop" "${pkgdir}/usr/share/applications/tuxedo-control-center.desktop"
  install -Dm644 "${srcdir}/opt/tuxedo-control-center/resources/dist/tuxedo-control-center/data/dist-data/de.tuxedocomputers.tcc.policy" "${pkgdir}/usr/share/polkit-1/actions/de.tuxedocomputers.tcc.policy"
  install -Dm644 "${srcdir}/opt/tuxedo-control-center/resources/dist/tuxedo-control-center/data/dist-data/com.tuxedocomputers.tccd.conf" "${pkgdir}/usr/share/dbus-1/system.d/com.tuxedocomputers.tccd.conf"
  install -Dm755 "$srcdir/opt/tuxedo-control-center/resources/dist/tuxedo-control-center/data/dist-data/tccd.service" "${pkgdir}/etc/systemd/system/tccd.service"
  install -Dm755 "$srcdir/opt/tuxedo-control-center/resources/dist/tuxedo-control-center/data/dist-data/tccd-sleep.service" "${pkgdir}/etc/systemd/system/tccd-sleep.service"
  echo -e "\033[31m\033[1m\033[4mThe systemd Services (tccd.service and tccd-sleep.service) must be manually enabled and started\033[0m"
  echo -e "\033[31m\033[1m\033[4mPlease run 'systemctl daemon-reload'\033[0m"
}
