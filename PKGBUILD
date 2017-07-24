# Maintainer: Douglas Soares de Andrade <douglas@archlinux.org>

pkgname=switchhosts-bin
pkgver=3.3.6
pkgrel=5287
pkgdesc="Switch hosts quickly!"
arch=('any')
url="https://oldj.github.io/SwitchHosts"
license=("MIT")
options=(!strip)
depends=("gconf" "gtk2" "libnotify" "libxtst" "nss" "python2" "xdg-utils" "desktop-file-utils" "alsa-lib")
makedepends=("imagemagick" "npm")

source=(
    "https://github.com/oldj/SwitchHosts/releases/download/v${pkgver}/SwitchHosts-linux-x64_v${pkgver}.${pkgrel}.zip"
    "https://raw.githubusercontent.com/oldj/SwitchHosts/master/assets/app.ico"
    "${pkgname}.install"
    "${pkgname}.desktop"
)

md5sums=('c051e239ce81a89d22b14c099c1afd66'
         '88fe4a72cf9630119dd512c91b54edd9'
         '0b6211b511da48346cecdc1d2f963c76'
         '30df36e53ef2d815a2c2395f0378f9bb')

package() {
    install -dm755 "$pkgdir/"{opt,usr/bin}
    mv "${srcdir}/SwitchHosts!-linux-x64" "${pkgdir}/opt/${pkgname}"
    ln -s "/opt/${pkgname}/SwitchHosts!" "$pkgdir/usr/bin/switchhosts"
    install -Dm644 ${srcdir}/${pkgname}.desktop "$pkgdir"/usr/share/applications/${pkgname}.desktop
    mkdir -p "icons"
    cd "icons"
    convert ${srcdir}/app.ico logo_icon.png
    cd -
    sizes=(256x256 128x128 48x48 32x32 16x16)
    for i in 0 1 2 3 4 5 ; do
      install -d "${pkgdir}/usr/share/icons/hicolor/${sizes[$i]}/apps"
      install -Dm644 "icons/logo_icon-${i}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${sizes[$i]}/apps/${pkgname}.png"
    done
}
