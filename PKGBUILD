# Maintainer: Mark Wagie <yochanan.marqos@gmail.com>
# Co-Maintainer: jswenson
# Packager: Chris Knepper <chris82thekid@gmail.com>
pkgname=android-messages-desktop
pkgver=0.4.0
pkgrel=4
pkgdesc="Android Messages as a cross-platform desktop app"
arch=('x86_64')
url="https://github.com/chrisknepper/android-messages-desktop"
license=('MIT')
depends=('c-ares' 'ffmpeg' 'gtk3' 'http-parser' 'libevent' 'libvpx' 'libxslt' 'libxss' 'minizip' 'nss' 're2' 'snappy' 'libnotify' 'libappindicator-gtk2' 'libappindicator-gtk3' 'libappindicator-sharp')
provides=(android-messages-desktop)
source=("${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.pacman")
md5sums=('fd08bc795496e7060d240c00b569d322')

package() {
    install -d "${pkgdir}/opt"
    cp -R "${srcdir}/opt/Android Messages" "${pkgdir}/opt/"
    install -D -m644 "${srcdir}/usr/share/applications/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    for icon_size in 16 24 32 48 64 128 256 512 1024; do
        icons_dir="/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps"
        install -d "${pkgdir}/${icons_dir}"
        install -m644 "${srcdir}${icons_dir}/${pkgname}.png" \
                      "${pkgdir}${icons_dir}/${pkgname}.png"
    done
    mkdir ${pkgdir}/usr/bin
    ln -sf "${pkgdir}/opt/Android Messages/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
