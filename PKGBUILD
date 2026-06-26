# Maintainer: Mike Hicklen (hicklemon) <mike@xfs.repair>
# Maintainer: Laszlo Malina <laszlo@malina.hu>

pkgname=keeper-password-manager
pkgver=18.4.0
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
sha512sums=('e9766afb0b46c44de79e1cf5c9b738a561047a8029f799ee7e70634266c7bb5f3c2dbd4c38e109dd0010079bdc9aaa5b02accbde72d1f73092bb456d6f1b8c6d'
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
