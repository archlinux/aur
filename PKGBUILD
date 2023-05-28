# Maintainer: Adrià Cabello <adro.cc79 at protonmail dot com>

pkgname=musicbee
_pkgver_major=3
_pkgver_minor=5
_pkgver_build=8447
pkgver=${_pkgver_major}.${_pkgver_minor}.${_pkgver_build}
pkgrel=3
pkgdesc="Advanced, feature-rich freeware audio player (uses Wine)"
arch=(i686 x86_64)
url=https://getmusicbee.com
license=(custom)
depends=(wine winetricks lib32-libpulse wine-mono)
makedepends=(p7zip)
optdepends=('wine-wl-git: Wayland Support')
source=("https://files1.majorgeeks.com/10afebdbffcd4742c81a3cb0f6ce4092156b4375/multimedia/MusicBeePortable_3_5.zip"
        "${pkgname}.desktop"
        "${pkgname}.sh"
        "https://www.un4seen.com/files/z/2/bass_aac24.zip") #M4A/AAC Support
sha256sums=('706a8bb4c1b453af0619a28705bc461011f77828aaaecbb67e1f48552addbed9'
            '054502f6dacceeeff10b7ac7511a514307a1e3f187c19f73b5913965c459dc6e'
            'f96144607119a44a2b07965b05e9fd0253b8e06ec4ac5eac394f6cb7e0bbbe83'
            '782ec4f3758fc715d29ceab332103266df4000dd413a477901dccb8c9bac2090')

package() {
  install -d -m755 ${pkgdir}/usr/share/$pkgname

  cd ${srcdir}
  7z x MusicBeePortable_3_5.exe -o$pkgname -y

  rm -r $pkgname/*PLUGINSDIR

  cp -ra "$srcdir/$pkgname/"* "${pkgdir}/usr/share/${pkgname}"
  cp -ra "$srcdir/bass_aac.dll" "${pkgdir}/usr/share/${pkgname}/"

  find "${pkgdir}/usr/share/${pkgname}" -type f -exec chmod 644 "{}" \;
  find "${pkgdir}/usr/share/${pkgname}" -type d -exec chmod 755 "{}" \;

  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  install -Dm644 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
  chmod +x "${pkgdir}/usr/bin/${pkgname}"
}
