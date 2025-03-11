# Maintainer: Mrmaxmeier <Mrmaxmeier+aur at gmail dot com>
# TODO: fall back to /builds/old in case the build artifact disappears

pkgname=bombsquad
pkgver=1.7.37
pkgrel=2
pkgdesc='An explosive arcade-style party game'
arch=('x86_64' 'aarch64')
url='http://www.froemling.net/apps/bombsquad'
license=('unknown')
depends=('openal' 'libgl' 'sdl2' 'libvorbis' 'libogg')
source=(
  "https://files.ballistica.net/bombsquad/promo/BombSquadIcon.png"
  'bombsquad.sh'
  'bombsquad.desktop'
)
sha256sums=('31f3af8d59a384b7a3ac999d2e8fe0a0033d0d31ae6e760686537ab85d86ba00'
            '850f8a66eb045ce833f8d7dae4533f69b629ac648bd205d98bf5f851339d4515'
            '900ffdf250eb2c59a2944703ccab9b69e58b5cdd7809f8349f6291db0301935c')
sha256sums_x86_64=('83dadb1f8df51dac37baf793e8eea1cd8f47858c8c63a793c0065f4e542f9839')
sha256sums_aarch64=('077d61f16a8849389e12b2b5d1fe9d13a34efc6eca8c31f1ef7fc55601a2eafe')
source_x86_64=("https://files.ballistica.net/bombsquad/builds/BombSquad_Linux_x86_64_${pkgver}.tar.gz")
source_aarch64=("https://files.ballistica.net/bombsquad/builds/BombSquad_Linux_Arm64_${pkgver}.tar.gz")


package() {
  cd "$srcdir"/BombSquad_Linux_*_"$pkgver"

  install -Dm755 bombsquad "$pkgdir"/usr/share/bombsquad/bombsquad
  install -dm755 ba_data "$pkgdir"/usr/share/bombsquad/ba_data
  cp -r ba_data "$pkgdir"/usr/share/bombsquad/

  find "${pkgdir}/usr/share/bombsquad/ba_data" -type f -exec chmod 644 {} \;
  find "${pkgdir}/usr/share/bombsquad/ba_data" -type d -exec chmod 755 {} \;

  install -Dm 755 "$srcdir"/bombsquad.sh "$pkgdir"/usr/bin/$pkgname
  install -Dm 644 "$srcdir"/bombsquad.desktop "$pkgdir"/usr/share/applications/bombsquad.desktop
  install -Dm 644 "$srcdir"/BombSquadIcon.png "$pkgdir"/usr/share/pixmaps/bombsquad.png
}


