# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Baptiste Jonglez <baptiste@jonglez.org>
# Contributor: Serge Ziryukin <ftrvxmtrx@gmail.com>

pkgname=asciiportal
pkgver=1.3
pkgrel=2
_tag=v$pkgver-beta8
pkgdesc='Text based puzzle game inspired by the popular video game'
arch=('x86_64' 'i686')
url='https://github.com/cymonsgames/ASCIIpOrtal'
license=('GPL3')
depends=('sdl' 'sdl_mixer' 'pdcurses' 'yaml-cpp')
makedepends=('git' 'boost')
makedepends=('imagemagick' 'gendesk' 'git' 'boost')
source=("git://github.com/cymonsgames/ASCIIpOrtal.git#tag=$_tag"
        "${pkgname}0.png::http://fc01.deviantart.net/fs71/f/2010/318/3/5/portal_ascii_icon___button_by_lightmystic-d32udqx.png")
sha256sums=('SKIP'
            '390f21881377b331f1a65a3e54ccf91fba72a88146058cc146f914a1185de9d1')

prepare() {
  # Generate desktop shortcut and icon
  gendesk -n -f --pkgname "$pkgname" --pkgdesc "$pkgdesc" --name 'ASCIIpOrtal' --exec "$pkgname"
  convert "${pkgname}0.png" -resize 48x48\! "$pkgname.png"
}

build() {
  make -C ASCIIpOrtal linux
}

package() {
  make -C ASCIIpOrtal DESTDIR="$pkgdir" install

  # Desktop shortcut and icon
  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
} 

# vim:set ts=2 sw=2 et:
