# Maintainer: Arkadiusz Dzięgielewski <arek.dzski@gmail.com>

pkgname=teamspeak
pkgver=5.0.0beta19
pkgrel=1
pkgdesc="TeamSpeak is software for quality voice communication via the Internet"
url="http://www.teamspeak.com"
license=('custom')
optdepends=('libpulse')
arch=('x86_64')
source=('teamspeak.desktop'
        'teamspeak.svg'
        "https://files.teamspeak-services.com/teamspeak/teamspeak-client.tar.gz")
noextract=('teamspeak-client.tar.gz')
sha512sums=('57c618d386023d27fcb5f6b7e5ce38fe7012680988aff914eeb6c246d855b190689bbad08d9824c864c1776af322e8df34019234128beb306a09b114673b37c9'
            '3b0c7fe2e71eb207a9874c3fba31c18067867481d81c7a8a2a9fef5956f04cfbd559186f6996e2e3d79292d1aaaae443ab6ea6272d0f6b3205fdd12387de27b0'
            '688c2abd89c0bccef1bd027c4fbbe9519a85479a2fda8ddd598ad899b508b5cc0a8c4902a137bc3d9d4fc05242cba0319f6021776e40d6e6f443c4531e54f40e')

prepare() {
  # Manually extracting archive to prevent mess in srcdir
  mkdir -p archive && cd archive
  bsdtar -xf "${srcdir}/teamspeak-client.tar.gz"
}

package() {
  install -d "${pkgdir}/usr/bin/"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -d "${pkgdir}/opt/${pkgname}"

  cp -r "${srcdir}/archive/"* "${pkgdir}/opt/${pkgname}/"

  install -Dm644 "${srcdir}/teamspeak.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${srcdir}/teamspeak.svg" "${pkgdir}/usr/share/pixmaps/teamspeak.svg"

  ln -s /opt/${pkgname}/TeamSpeak/licenses/en/la.html "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  ln -s /opt/${pkgname}/TeamSpeak "${pkgdir}/usr/bin/teamspeak"
}
