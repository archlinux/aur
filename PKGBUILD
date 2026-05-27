# Maintainer: Mike Hicklen (hicklemon) <mike@xfs.repair>
# Maintainer: Laszlo Malina <laszlo@malina.hu>

pkgname=keeper-password-manager
pkgver=18.0.2
pkgrel=1
pkgdesc="Keeper is the world's #1 most downloaded password keeper and secure digital 
 vault for protecting and managing your passwords and other secret information."
arch=('x86_64')
url="https://keepersecurity.com"
license=('LicenseRef-proprietary')

depends=(
  'gtk3'
  'libnotify'
  'nss'
  'xdg-utils'
  'at-spi2-core'
  'libdrm'
  'mesa'
  'libxcb'
  'libxss'
  'pcsclite'
  'alsa-lib'
)

optdepends=(
  'gnome-keyring: GNOME keyring integration for credential storage'
  'libsecret: secret storage backend'
  'pipewire-pulse: PulseAudio-compatible audio (recommended)'
  'pulseaudio: PulseAudio audio backend (alternative)'
  'trash-cli: trash support for xdg-utils'
  'lsb-release: OS version detection'
)

source=(
  "https://keepersecurity.com/desktop_electron/Linux/repo/deb/keeperpasswordmanager_${pkgver}_amd64.deb"
  'LICENSE'
)
sha512sums=('50d2d6678a929faf82c3878bc3ab3a731fc23ed3ba5d8b8c2af95601cb84b261da658d5d039f2c9759bf1f5df10b7f7ebc3b01e32d8e4b66a38839e8822c8f45'
            '9bd161a552aba146ee89ab930b8a444442d3cb4bba8cf5e94d1a04bfe2c99fae8372d0d04d5b01fe489578429e9fd020cb567e005b1a267fcb51a0bc4cb2f7b2')

package() { 
  bsdtar -xf "$srcdir"/data.tar.xz -C "$pkgdir"   

  echo "Setting needed '4755' mode to file: chrome-sandbox."
  chmod 4755 "$pkgdir"/usr/lib/keeperpasswordmanager/chrome-sandbox
  echo "If you are updating from 16.0.0 to a newer version, you will need to set '755' mode on directories: resources/*, locales, swiftshader - commands are below, USE AT YOUR OWN RISK:"
  echo 'find /usr/lib/keeperpasswordmanager/resources -type d -print0 | xargs -0 chmod 755'
  echo 'chmod 755 /usr/lib/keeperpasswordmanager/locales'
  echo 'chmod 755 /usr/lib/keeperpasswordmanager/swiftshader'

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm644 "$pkgdir"/usr/lib/keeperpasswordmanager/LICENSES.chromium.html "$pkgdir"/usr/share/licenses/chromium/LICENSES.chromium.html
}
