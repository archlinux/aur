# Maintainer: Mrmaxmeier <Mrmaxmeier+aur at gmail dot com>
# TODO: fall back to /builds/old in case the build artifact disappears

pkgname=bombsquad
pkgver=1.5.8
pkgrel=1
pkgdesc='An explosive arcade-style party game'
arch=('x86_64')
url='http://www.froemling.net/apps/bombsquad'
license=('unknown')
depends=('openal' 'libgl' 'sdl2' 'libvorbis' 'libogg')
source=(
  "http://www.files.froemling.net/bombsquad/builds/BombSquad_Linux_${pkgver}.tar.gz"
  'bombsquad.sh'
  'bombsquad.desktop'
)
sha256sums=(
  '20358943812076a44b0846fd6925cfeb2aada9da3af2c0aa5027467acf275671'
  '850f8a66eb045ce833f8d7dae4533f69b629ac648bd205d98bf5f851339d4515'
  '900ffdf250eb2c59a2944703ccab9b69e58b5cdd7809f8349f6291db0301935c'
)


package() {
  cd "$srcdir"/BombSquad_Linux_"$pkgver"

  install -Dm755 bombsquad "$pkgdir"/usr/share/bombsquad/bombsquad
  install -dm755 ba_data "$pkgdir"/usr/share/bombsquad/ba_data
  cp -r ba_data "$pkgdir"/usr/share/bombsquad/

  find "${pkgdir}/usr/share/bombsquad/ba_data" -type f -exec chmod 644 {} \;
  find "${pkgdir}/usr/share/bombsquad/ba_data" -type d -exec chmod 755 {} \;

  install -Dm 755 "$srcdir"/bombsquad.sh "$pkgdir"/usr/bin/$pkgname
  install -Dm 644 "$srcdir"/bombsquad.desktop "$pkgdir"/usr/share/applications/bombsquad.desktop
}


