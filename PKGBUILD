# Maintainer: arraen
pkgname="synergy3-bin"
pkgver="v3.0.69.17"
pkgrel="1"
pkgdesc="Share a single mouse and keyboard between multiple computers"
url="https://symless.com/synergy"
license=('unknown')
arch=("x86_64")
source_x86_64=("https://rc.symless.com/$pkgname/$pkgver-beta/synergy-linux_x64-libssl3-$pkgver-beta.deb")
sha256sums_x86_64=("9d93e7ee050fa6617a10ef675dc0beb6675c5af4ece4058b08548fdb8e9d4712")

conflicts=('synergy1-bin' 'synergy-git' 'synergy-1.6' 'synergy2-bin')
depends=('openssl')
optdepends=('libappindicator-gtk3')
options=("!strip")

package() {
  find $srcdir/ -mindepth 1 -maxdepth 1 -type d | xargs cp -r -t "$pkgdir"
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
