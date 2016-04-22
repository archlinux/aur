# Maintainer Ethan Apodaca <papodaca at gmail dot com>
# Upstream URL: https://github.com/officert/mongotron

pkgname=mongotron-bin
pkgver=1.0.0.alpha2
pkgrel=1
pkgdesc="Chrome-based mongo db management tool - Precompiled binary from official repository"
arch=("x86_64")
url="https://github.com/officert/mongotron"
license=("MIT")
options=(!strip)
depends=("gconf" "gtk2" "libnotify" "libxtst" "nss" "python2" "xdg-utils" "desktop-file-utils" "alsa-lib" "libgnome-keyring")
makedepends=("imagemagick")
install=$pkgname.install

sha256sums=("bb19bb92859ffd1c35f98cff6380dac43529800654cb9097742a0075ca2e4eeb"
            "9fe12f1bc573f5d431fcc8f9ca3ed17fc1e1d30248ae3b58209fc53084ae0a4e"
            "0f89e95299de6cf447a0276ced3960424dfa94fa270174cc892a2dfe0a46c2ad")
source=("${pkgname}.desktop"
        "${pkgname}.install"
        "https://github.com/officert/mongotron/releases/download/v1.0.0-alpha.2/Mongotron-linux-x64.zip")

package() {
  mkdir "${pkgdir}/opt"
  mv "${srcdir}/Mongotron-linux-x64" "${pkgdir}/opt/${pkgname}"
  install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/mongotron.desktop
  cd "${pkgdir}/opt/$pkgname/resources/app/resources/icon/"
  convert logo_icon.ico logo_icon.png
  cd -
  sizes=(256x256 128x128 48x48 32x32 16x16)
  for i in 0 1 2 3 4 5 ; do
    install -d "${pkgdir}/usr/share/icons/hicolor/${sizes[$i]}/apps"
    ln -s "/opt/${pkgname}/resources/app/resources/icon/logo_icon-${i}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${sizes[$i]}/apps/${pkgname}.png"
  done
}

