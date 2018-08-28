# Maintainer: Will Price <will.price94@gmail.com>

# Inspired by https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=jetbrains-toolbox
# and https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=hyper-appimage

pkgname=gingko
pkgver=2.2.1
pkgrel=1
pkgdesc='Gingko is a new kind of tool, that lets you shape your ideas with lists, outlines and cards, all in the same clean interface.'
arch=('x86_64' 'i686')
url='https://gingko.io/'
license=('Commercial')
depends=()
options=('!strip')
source=("https://github.com/gingko/client/releases/download/v${pkgver}/gingko-client-${pkgver}-x86_64.AppImage"
        "gingko.desktop")

prepare() {
    chmod +x "${srcdir}/gingko-client-${pkgver}-x86_64.AppImage"
    "${srcdir}/gingko-client-${pkgver}-x86_64.AppImage" --appimage-extract
}

package() {
  install -d -m 755 "${pkgdir}/usr/bin/"
  install -d -m 755 "${pkgdir}/opt/${pkgname}"
  cp -Rr "${srcdir}/squashfs-root/"* "${pkgdir}/opt/${pkgname}"

  install -d -m755 "${pkgdir}/usr/share/icons/hicolor"
  cp -Rr "${srcdir}/squashfs-root/usr/share/icons/hicolor/" \
         "${pkgdir}/usr/share/icons/"

  install -D -m 644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  ln -s "/opt/${pkgname}/gingko-client" "${pkgdir}/usr/bin/${pkgname}"

  # fix file permissions - all files as 644 - directories as 755
  # by default directories come out as 700
  find "${pkgdir}/"{opt,usr} -type d -exec chmod 755 {} \;
  find "${pkgdir}/"{opt,usr} -type f -exec chmod 644 {} \;
  chmod +x "${pkgdir}/opt/${pkgname}/gingko-client"
}
sha512sums=('daad7073dbe580e2426f87b3ae8b7fe6a063d40584966373b49787a266fbd1964ed9ef6f3724cd53dcbadce0ea493510b97cc2fc1121f1ded3c4e77c64751ae3'
            'c11e9c2541211d0ff43d4ff26fd23f6c64d8bb8008bddbbe174a420a69cc981120c3c5466e47894515fee0dbaccd95309eb61a16ffc3b3193af0609e62b46820')
sha512sums=('daad7073dbe580e2426f87b3ae8b7fe6a063d40584966373b49787a266fbd1964ed9ef6f3724cd53dcbadce0ea493510b97cc2fc1121f1ded3c4e77c64751ae3'
            'c11e9c2541211d0ff43d4ff26fd23f6c64d8bb8008bddbbe174a420a69cc981120c3c5466e47894515fee0dbaccd95309eb61a16ffc3b3193af0609e62b46820')
