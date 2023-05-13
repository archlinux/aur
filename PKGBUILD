# Maintainer: arraen
pkgname="synergy3-bin"
pkgver="v3.0.70.34"
pkgrel="1"
pkgdesc="Share a single mouse and keyboard between multiple computers"
url="https://symless.com/synergy"
license=('unknown')
arch=("x86_64")
source_x86_64=("https://rc.symless.com/synergy3/$pkgver-beta/synergy-linux_x64-libssl3-$pkgver-beta.deb")
sha256sums_x86_64=("766fecc5a17b4f4c125558a55609171aecbddbef4f2a7350aede59476b73b1bd")

conflicts=('synergy1-bin' 'synergy-git' 'synergy-1.6' 'synergy2-bin')
depends=('openssl')
optdepends=('libappindicator-gtk3')
options=("!strip")

package() {
  bsdtar -xf ${srcdir}/data.tar.xz -C ${pkgdir}/
}

post_install() {
  sudo ./opt/Synergy/synergy-service --install
  chmod 4755 '/opt/Synergy/chrome-sandbox' || true
  update-mime-database /usr/share/mime || true
  update-desktop-database /usr/share/applications || true
}

pre_remove() {
  sudo ./opt/Synergy/synergy-service --uninstall
}

post_remove() {
  rm -f '/usr/bin/synergys'
  rm -f '/usr/bin/synergyc'
  rm -f '/usr/bin/synergy-core'
}
