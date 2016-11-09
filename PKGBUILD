# Maintainer: Doyle Fermi <doylefermi@gmail.com>
pkgname=wmail-bin-git
pkgver=2.0.6
pkgrel=1
pkgdesc="A more up-to-date repo of the missing desktop client for Gmail & Google Inbox"
arch=('x86_64')
url="https://github.com/Thomas101/wmail"
repo="git://github.com/Thomas101/wmail.git"
license=('MIT')
options=(!strip)
makedepends=('xdg-utils' 'desktop-file-utils')
depends=('gconf' 'gtk2' 'libxtst' 'nss' 'alsa-lib' 'libxss')
optdepends=('gvfs' 'libnotify')
conflicts=('wmail' 'wmail-bin')

source=(
  
"wmail-linux-v${pkgver}.tar.gz::https://github.com/Thomas101/wmail/releases/download/v${pkgver}/WMail_${pkgver//./_}_prerelease_linux_${arch}.tar.gz"
  "app-v${pkgver}.png::https://raw.githubusercontent.com/Thomas101/wmail/v${pkgver}/assets/icons/app.png"
  "wmail.desktop")
noextract=("wmail-linux-v${pkgver}.tar.gz")
sha256sums=('fc3410287d140b231f35c751e62ea7bc3c0d764ca7917efc33a17b2e42fc1cf5'
            '08d2f7997cddab19598ebf25dc88210992a1e220381046662929f61b240a906b'
            '47fb6b3c0d49280cfca89b034b1b714d64a1e158114abcc20a7b6c40faff9a7b')

package() {
  mkdir -p "${pkgdir}/tmp"
  mkdir -p "${pkgdir}/usr/share/wmail"
  bsdtar -C "${pkgdir}/tmp" -xf "${srcdir}/wmail-linux-v${pkgver}.tar.gz"
  cp -R "${pkgdir}/tmp/WMail-linux-x64/." "${pkgdir}/usr/share/wmail"
  rm -rf "${pkgdir}/tmp"
  mkdir -p "${pkgdir}/usr/bin"
  ln -s "/usr/share/wmail/WMail" "${pkgdir}/usr/bin/wmail"
  RPM_BUILD_ROOT="$pkgdir" desktop-file-install "${srcdir}/wmail.desktop"
  install -Dm644 "${srcdir}/app-v${pkgver}.png" "${pkgdir}/usr/share/pixmaps/WMail.png"
}
