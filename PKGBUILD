# Maintainer: FichteFoll <fichtefoll2@googlemail.com>

pkgname=open-riichi-git
pkgver=0.1.3.2.r1.g8c5918e
pkgrel=1
pkgdesc='An open source riichi (Japanese) mahjong client'
arch=('x86_64')
url='https://github.com/FluffyStuff/OpenRiichi'
license=('GPL')
depends=('gcc' 'libgee' 'glew' 'pango' 'sdl2' 'sdl2_image' 'csfml' 'sfml')
makedepends=('git' 'vala')
source=('OpenRiichi::git+https://github.com/FluffyStuff/OpenRiichi.git'
        'Engine::git+https://github.com/FluffyStuff/Engine.git'
        'OpenRiichi.desktop')
sha256sums=('SKIP'
            'SKIP'
            'fa43b7e9477b3cba48e9a0f50699a480d0b1c12320c950f9b4465eb1d9b4a742')

pkgver() {
  cd OpenRiichi

  git describe --tags --long | sed 's/^v//; s/\([^-]*-g\)/r\1/; s/-/./g'
}

build() {
  cd OpenRiichi

  make release
}

package() {
  install -Dm 644 OpenRiichi.desktop -t "${pkgdir}"/usr/share/applications
  # install -Dm 755 ../OpenRiichi.sh "${pkgdir}"/usr/bin/OpenRiichi

  cd OpenRiichi
  mkdir -p "${pkgdir}"/opt/OpenRiichi
  cp -r bin/* "${pkgdir}"/opt/OpenRiichi
  install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/$pkgname/
  install -Dm 644 bin/Data/Icon.png "${pkgdir}"/usr/share/pixmaps/OpenRiichi.png
}
