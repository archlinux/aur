# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=adtrack2-bin
pkgver=2.4.24
pkgrel=6
pkgdesc='Adlib Tracker II, OPL3 music tracker'
arch=(x86_64)
url="http://www.adlibtracker.net"
license=('GPL-3.0-or-later') # the source code has GPL at the top of the files
depends=('bash' 'lib32-glibc' 'lib32-sdl12-compat')
optdepends=('lib32-alsa-lib: sound support for ALSA'
            'lib32-pipewire: sound support for Pipewire'
            'lib32-libpulse: sound support for PulseAudio')
source=("https://adlibtracker.net/files/adtrack-2.4.24-linux-bin-debian-stretch-x86.tar.gz"
        adtrack2.desktop
        adtrack2.sh
        LICENSE)
sha256sums=('fdfbb29ae5da944d082a1d33331532745bdfca92acea67eabeae3ff446ec8b17'
            'f99d6fb998ec8475abb9b258d115ff2ee02fb7e00350fc9aba82c54d0807908c'
            '5ab9050335471e8bd7d8c5c3da8c646d3b47dabef404d4e3cdab23ca3423a03e'
            'c38f322ecc2ebc88c1c775614543fbc6acad72ec13cb9ff6c023c3f5247de39f')

package() {
  cd "adtrack-$pkgver-linux-bin-debian-stretch-x86"
  install -Dm755 adtrack2 "$pkgdir/usr/bin/adtrack2.elf"
  install -Dm755 adtrack2.ini "$pkgdir/usr/share/adtrack2/adtrack2.ini"
  install -Dm755 "$srcdir/adtrack2.sh" "$pkgdir/usr/bin/adtrack2"
  install -Dm644 revision.txt "$pkgdir/usr/share/doc/adtrack2/changelog.txt"
  cp -rv adtrack2.mht instr modules "$pkgdir/usr/share/adtrack2/"
  chmod -R a+rX "$pkgdir/usr/share/adtrack2"
  install -Dm644 adtrack2.png "$pkgdir/usr/share/pixmaps/adtrack2.png"
  install -Dm644 "$srcdir/adtrack2.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
