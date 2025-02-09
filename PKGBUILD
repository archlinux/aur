# Maintainer: Jefferson Gonzalez <jgmdev@gmail.com>
# Contributor: Autumn Boyhan <autumn@crisismodel.com>

pkgname=retux
pkgver=1.6.2
pkgrel=2
pkgdesc='Action platformer loosely inspired by the Mario games, utilizing the art assets from the SuperTux project.'
arch=('x86_64' 'aarch64')
url='https://retux-game.github.io/'
license=('GPL3')
depends=(
  'python-pygame'
  'sdl'
  'sdl_image'
  'sdl_mixer'
)
makedepends=(
  'python-pip'
  'python-wheel'
)
source=(
  "https://github.com/retux-game/retux/archive/refs/tags/v${pkgver}.tar.gz"
  "${pkgname}.desktop"
  "${pkgname}.sh"
)
md5sums=(
  'd4d42e087bc83e3659b800d5c3e654bd'
  'fb978c84e98beabb5f40994e75b0970b'
  'ccbf95e58139b2192e4a6b87ce8e2de2'
)

build() {
  cd "$srcdir"/${pkgname}-${pkgver}

  mkdir libs

  install_path="$(pwd)/libs"

  python3 -m \
    pip install --no-compile --prefix "${install_path}" -r requirements.txt
}

package() {
  mkdir -p ${pkgdir}/usr/bin
  mkdir -p ${pkgdir}/usr/share/applications
  mkdir -p ${pkgdir}/usr/share/icons

  cp -a ${srcdir}/${pkgname}-${pkgver} ${pkgdir}/usr/share/${pkgname}

  cp ${srcdir}/${pkgname}.sh ${pkgdir}/usr/bin/${pkgname}
  chmod +x ${pkgdir}/usr/bin/${pkgname}

  cp ${pkgdir}/usr/share/${pkgname}/data/images/misc/icon.png \
    ${pkgdir}/usr/share/icons

  mv ${pkgdir}/usr/share/icons/icon.png ${pkgdir}/usr/share/icons/retux.png

  cp retux.desktop ${pkgdir}/usr/share/applications
}
