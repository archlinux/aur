# Maintainer: Connor McFarlane <cm at semtex dot net>

pkgname=flexoptix
pkgver=5.10.0
pkgrel=1
pkgdesc='Flexoptix programmer'
arch=('any')
url='https://www.flexoptix.net/en/flexoptix-app'
license=('custom')
depends=('hidapi')
install=flexoptix.install
_appimgname="FLEXOPTIX%20App.${pkgver}.AppImage"
source=("https://flexbox.reconfigure.me/download/electron/linux/x64/${_appimgname}"
        'https://www.flexoptix.net/skin/udev_rules/99-tprogrammer.rules')
sha256sums=('2b7b450cfabec3e61e8f4caeb0873427e0793e36b488fdb131ba8112a069f70c'
            '3997b9755e74c6af7da252266e8ec94313e345dee11b204857016fb51f5c2157')
noextract=("${_appimgname}")

prepare() {
  chmod +x "${srcdir}/${_appimgname}"
  "${srcdir}/${_appimgname}" --appimage-extract
}

package() {
  install -d "${pkgdir}/opt/flexoptix"
  install -d "${pkgdir}/usr/local/bin"

  _appdir="${srcdir}/squashfs-root"

  cp -rT "${_appdir}" "${pkgdir}/opt/flexoptix"

  install -D "${srcdir}/99-tprogrammer.rules" "${pkgdir}/etc/udev/rules.d/99-flexoptix.rules"

  ln -s "${pkgdir}/opt/flexoptix/flexoptix-app" "${pkgdir}/usr/local/bin/flexoptix"

  install -Dm644 "${_appdir}/flexoptix-app.desktop" "${pkgdir}/usr/share/applications/flexoptix-app.desktop"
  install -Dm644 "${_appdir}/flexoptix-app.png" "${pkgdir}/usr/share/applications/flexoptix-app.png"
}

