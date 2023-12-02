# Maintainer: LY <ly-niko@qq.com>
pkgname="canokey-console-legacy"
pkgver="1.0.0"
pkgrel="1"
pkgdesc="Local version of https://console.legacy.canokeys.org"
arch=('any')
depends=()
optdepends=('python-twisted: run web server, must manually install twisted otherwise.'
            'ungoogled-chromium: Browser with WebUSB support.')
license=("custom")
source=("src.tar.gz")
sha512sums=("afe3fccb9bcf1ea027c11a380e6edfde62efe1c1509353ca6a1c96f248996e809c2ac5ca625352275d2613a50c728744ddf97ce2e564a5ec96c9b34a63e923ed")

post_install() {
  systemctl --user daemon-reload
}

package() {
  mkdir -p "${pkgdir}/usr/lib/canokey-console-legacy" "${pkgdir}/usr/lib/systemd/user/" "${pkgdir}/usr/bin"
  cp -r "${srcdir}/"*.ico "${srcdir}/"*.png "${srcdir}"/*.html "${srcdir}"/*.json "${srcdir}"/*.js "${srcdir}"/*.sh "${srcdir}"/static "${pkgdir}/usr/lib/canokey-console-legacy/"
  ln -s "/usr/lib/canokey-console-legacy/run.sh" "${pkgdir}/usr/bin/canokey-console-legacy-daemon"
  ln -s "/usr/lib/canokey-console-legacy/open.sh" "${pkgdir}/usr/bin/canokey-console-legacy"
  cp "${pkgdir}/usr/lib/canokey-console-legacy/index.html" "${pkgdir}/usr/lib/canokey-console-legacy/admin"
  cp "${pkgdir}/usr/lib/canokey-console-legacy/index.html" "${pkgdir}/usr/lib/canokey-console-legacy/oath"
  cp "${pkgdir}/usr/lib/canokey-console-legacy/index.html" "${pkgdir}/usr/lib/canokey-console-legacy/piv"
  cp "${pkgdir}/usr/lib/canokey-console-legacy/index.html" "${pkgdir}/usr/lib/canokey-console-legacy/apdu"
  chmod +x "${pkgdir}/usr/lib/canokey-console-legacy/open.sh" "${pkgdir}/usr/lib/canokey-console-legacy/run.sh"
  cp "${srcdir}/canokey-console-legacy.service" "${pkgdir}/usr/lib/systemd/user/"
}
