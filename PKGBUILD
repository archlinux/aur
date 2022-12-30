# Maintainer: Adrià Cabello <adro.cc79 at protonmail dot com>

pkgname=musicbee
_pkgver_major=3
_pkgver_minor=4
_pkgver_build=8033
pkgver=${_pkgver_major}.${_pkgver_minor}.${_pkgver_build}
pkgrel=3
pkgdesc="Advanced, feature-rich freeware audio player (uses Wine)"
arch=(i686 x86_64)
url=https://getmusicbee.com
license=(custom)
depends=(wine winetricks lib32-libpulse wine-mono)
makedepends=(p7zip)
source=("https://files1.majorgeeks.com/10afebdbffcd4742c81a3cb0f6ce4092156b4375/multimedia/MusicBeePortable_3_4_Update2.zip"
        "${pkgname}.desktop"
        "${pkgname}.sh"
        "https://www.un4seen.com/files/z/2/bass_aac24.zip") #M4A/AAC Support
sha256sums=('b03721d71b6f082cddd15d847b08c39c57d45f73f2b59a37b74f2c217ce05321'
            '054502f6dacceeeff10b7ac7511a514307a1e3f187c19f73b5913965c459dc6e'
            '15a105c0832037220c1617bcc1511c77095cad797a63f83443fcf90650c0651b'
            '782ec4f3758fc715d29ceab332103266df4000dd413a477901dccb8c9bac2090')

package() {
  install -d -m755 ${pkgdir}/usr/share/$pkgname

  cd ${srcdir}
  7z x MusicBeePortable_3_4_Update2.exe -o$pkgname -y

  rm -r $pkgname/*PLUGINSDIR

  cp -ra "$srcdir/$pkgname/"* "${pkgdir}/usr/share/${pkgname}"
  cp -ra "$srcdir/bass_aac.dll" "${pkgdir}/usr/share/${pkgname}/"

  find "${pkgdir}/usr/share/${pkgname}" -type f -exec chmod 644 "{}" \;
  find "${pkgdir}/usr/share/${pkgname}" -type d -exec chmod 755 "{}" \;

  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  install -Dm644 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
  chmod +x "${pkgdir}/usr/bin/${pkgname}"
}
