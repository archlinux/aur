# Maintainer: Arkadiusz Dzięgielewski <arek.dzski@gmail.com>

pkgname=teamspeak
pkgver=5.0.0beta24
pkgrel=2
pkgdesc="TeamSpeak is software for quality voice communication via the Internet"
url="http://www.teamspeak.com"
license=('custom')
optdepends=('libpulse')
arch=('x86_64')
source=('teamspeak.desktop'
        'teamspeak.svg'
        "teamspeak-client-$pkgver.tar.gz::https://files.teamspeak-services.com/teamspeak/teamspeak-client.tar.gz")
sha512sums=('57c618d386023d27fcb5f6b7e5ce38fe7012680988aff914eeb6c246d855b190689bbad08d9824c864c1776af322e8df34019234128beb306a09b114673b37c9'
            '3b0c7fe2e71eb207a9874c3fba31c18067867481d81c7a8a2a9fef5956f04cfbd559186f6996e2e3d79292d1aaaae443ab6ea6272d0f6b3205fdd12387de27b0'
            '7ee9d088cf4f2e5b6fddba10f8586ffe4309dcf346f5b44dde89ceb9203746f7191247a3a0e3eb48cf7f21728734be3445c44dd025dd93f14b0bfce62d7e3623')

package() {
  install -d "${pkgdir}/usr/bin/"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -d "${pkgdir}/opt/${pkgname}"

  # Recursively installing all top-level regular files and directories from srcdir
  #   Files supplied to makepkg as sources are present in srcdir using symbolic links
  #   That way we can only copy files extracted from source archives
  find "${srcdir}" -mindepth 1 -maxdepth 1 -type d,f -exec cp -r {} "${pkgdir}/opt/${pkgname}/" \;

  install -Dm644 "${srcdir}/teamspeak.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${srcdir}/teamspeak.svg" "${pkgdir}/usr/share/pixmaps/teamspeak.svg"

  ln -s /opt/${pkgname}/TeamSpeak/licenses/en/la.html "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  ln -s /opt/${pkgname}/TeamSpeak "${pkgdir}/usr/bin/teamspeak"
}
