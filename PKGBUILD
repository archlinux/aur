# Maintainer Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=freeorion-bin
pkgver=0.4.10.1
pkgrel=1
pkgdesc='A free, Open Source, turn-based space empire and galactic conquest computer game'
url='https://www.freeorion.org'
arch=('x86_64')
license=('GPL2')
provides=('freeorion')
conflicts=('freeorion-git' 'freeorion')
options=('!strip')
depends=('python'
         'sdl2'
         'libvorbis'
         'openal'
         'freetype2'
         'freeorion-data')
source=("${pkgname%-bin}-${pkgver}.deb::http://ftp.br.debian.org/debian/pool/main/f/freeorion/freeorion_${pkgver}-1+b1_arm64.deb")
sha256sums=('626899b3dfe5a7f972953187ceeab7b70faaeec02a7c924c763009d23278c117')

package() {
  tar xvf data.tar.xz -C "${pkgdir}"
  install -d "${pkgdir}/usr/bin"
  mv "${pkgdir}/usr/games/freeorion" "${pkgdir}/usr/bin"
  rm -rf "${pkgdir}/usr/games"
  sed -i "10s|/usr/|/opt/usr/lib:/usr/|" "${pkgdir}/usr/bin/freeorion"
}
