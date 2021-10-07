# Maintainer: kylon
pkgname=gpd-winmax-mutekey-fix
pkgver=1.0
pkgrel=1
pkgdesc="Mute key fix for GPD Win Max"
arch=(any)
license=('gpl')
source=(
  "mutekey-fix.service"
  "mutekey-fix"
)
sha256sums=(
  '501189aecde241fcaa7eb569000ab99d7d142bf4c1f1dc4e79e381cd3892fd69'
  '66fa38cafe47d339a81a6f83025d1179c0fe2482a74533c93457bda08316b677'
)
install='PKGBUILD'

package() {
  install -Dm644 "${srcdir}/mutekey-fix.service"\
	"${pkgdir}/etc/systemd/system/mutekey-fix.service"

  install -Dm755 "${srcdir}/mutekey-fix" "${pkgdir}/usr/local/bin/mutekey-fix"
}

post_install() {
    echo "Enabling systemd service"
    systemctl enable mutekey-fix.service
    echo "Starting systemd service"
    systemctl start mutekey-fix.service
}

post_upgrade() {
    echo "Reloading systemd"
    systemctl daemon-reload
}
