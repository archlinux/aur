# Maintainer: Michael Taboada <michael@2mb.solutions.
# Maintainer: Storm Dragon <storm_dragon@linux-a11y.org>
pkgname=swamp-wine
pkgver=3.8C
pkgrel=1
pkgdesc="First-person Audio Shooter"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://kaldobsky.com/audiogames"
license=('custom')
_depends_x86_64=(lib32-sdl2 lib32-ncurses lib32-mpg123 lib32-libpulse lib32-libpng lib32-libjpeg-turbo lib32-gnutls lib32-alsa-plugins lib32-alsa-lib lib32-mesa lib32-openal)
depends=(wine winetricks wine_gecko wine-mono sdl2 ncurses mpg123 libpulse libpng libjpeg-turbo gnutls alsa-plugins alsa-lib mesa openal)
if [ "$CARCH" == "x86_64" ] ;then
  depends+=(${_depends_x86_64[@]})
fi
makedepends=(unzip)
install="swamp-wine.install"
source=('https://kaldobsky.com/audiogames/Swamp.zip'
        'swamp.sh'
        'swamp.desktop')
md5sums=('57b40c8eb603ce0d4afdcdb0ab0d5df6'
         'da8f92a4401b59490f4f40cc306e9de8'
         '5f057a09fe8f0d8e21e7636a3a33a184')
noextract=('Swamp.zip')

prepare() {
  cd "$srcdir"
  mkdir swamp
  unzip -q -d swamp Swamp.zip
}

package() {
  cd "$srcdir"
  install -dm755 "$pkgdir"/opt/swamp
  cp -R swamp/* "$pkgdir"/opt/swamp
  install -dm755 "$pkgdir"/usr/bin
  install -m755 swamp.sh "$pkgdir"/usr/bin/swamp
  install -dm755 "$pkgdir"/usr/share/applications/
  cp swamp.desktop "$pkgdir"/usr/share/applications
}
