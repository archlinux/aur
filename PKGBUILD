# Maintainer Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=freeorion-bin
pkgver=0.4.10
pkgrel=2
pkgdesc='A free, Open Source, turn-based space empire and galactic conquest computer game'
url='https://www.freeorion.org'
arch=('x86_64')
license=('GPL2')
depends=('python'
         'sdl2'
         'libvorbis'
         'openal'
         'freetype2'
         'freeorion-data')
provides=('freeorion')
conflicts=('freeorion-git' 'freeorion')
source=("${pkgname%-bin}-${pkgver}.deb::http://http.us.debian.org/debian/pool/main/f/freeorion/freeorion_${pkgver}-1_amd64.deb")
sha256sums=('8a4424a414895f72736429448849b6075fe858f62df62aa6529f597559963c09')

package() {
  tar xvf data.tar.xz -C "${pkgdir}"
  install -d "${pkgdir}/usr/bin"
  mv "${pkgdir}/usr/games/freeorion" "${pkgdir}/usr/bin"
  rm -rf "${pkgdir}/usr/games"
  sed -i "10s|/usr/|/opt/usr/lib:/usr/|" "${pkgdir}/usr/bin/freeorion"
}