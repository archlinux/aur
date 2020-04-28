# Maintainer: Amit Mendapara <mendapara dot amit at gmail dot com>

# Check for new Linux releases in: https://apps.fedoraproject.org/packages/chromium

pkgname=chromium-fedora
pkgver=81.0.4044.122
pkgrel=2

_rpmver=$pkgver
_rpmrel=1
_fedorarel=33
_fedoramirror=http://mirrors.dotsrc.org/fedora/linux/development/rawhide/Everything/x86_64/os/Packages/c

pkgdesc="A WebKit (Blink) powered web browser"
arch=('x86_64')
url="https://www.chromium.org/Home"
license=('BSD' 'LGPLv2+' 'ASL 2.0' 'IJG' 'MIT' 'GPLv2+' 'ISC' 'OpenSSL' 'MPLv1.1' 'GPLv2' 'LGPLv2')
depends=('gtk3' 'nss' 'xdg-utils' 'libxslt' 'libxss' 'libjpeg6-turbo' 'libva' 'libpipewire02'
         'ffmpeg' 'flac' 'minizip' 'snappy' 'hicolor-icon-theme' 'ttf-liberation')
optdepends=('pepper-flash: for flash support'
            'kdialog: for file dialogs in KDE'
            'gnome-keyring: for storing passwords in GNOME keyring'
            'kwallet: for storing passwords in KWallet')
options=('!emptydirs' '!strip')
provides=('chromium')
conflicts=('chromium')
source=(
  ${_fedoramirror}/chromium-${_rpmver}-${_rpmrel}.fc${_fedorarel}.x86_64.rpm
  ${_fedoramirror}/chromium-common-${_rpmver}-${_rpmrel}.fc${_fedorarel}.x86_64.rpm
  ${_fedoramirror}/chromedriver-${_rpmver}-${_rpmrel}.fc${_fedorarel}.x86_64.rpm
)
sha256sums=(
  '8b20c658057ed12ee370aa0e7032ba63eb5f75a3905b2c6785fc02d4e8429ded'
  'ce06e8e00fbe6916e7a700b8d92fc824e38faaf5c46115567e852cc44062f40d'
  '0f4275e121685520c64ec7b7c5a0e500af5512dd4fa42da6aa126fa497e06615'
)

package() {

  cp -r usr/ "$pkgdir/usr/"

  rm -rf "$pkgdir/usr/lib"
  rm -rf "$pkgdir/usr/etc"

  mv "$pkgdir/usr/lib64" "$pkgdir/usr/lib"

  chmod 4755 "$pkgdir/usr/lib/chromium-browser/chrome-sandbox"
}

# vim:set ts=2 sw=2 et:
