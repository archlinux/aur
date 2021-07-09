# Maintainer:  <reg-archlinux AT klein DOT tuxli DOT ch> 

pkgname=fallingtime
pkgver=1.0.2
pkgrel=1
pkgdesc="Arcade game inspired by Fall Down. SDL 2, PC or OpenDingux."
arch=('any')
url="https://github.com/cxong/FallingTime"
license=('GPL2')
makedepends=('git' 'cmake')
depends=('sdl2' 'sdl2_image' 'sdl2_mixer' 'sdl2_ttf')
source=("${pkgname}-${pkgver}.zip::https://github.com/cxong/FallingTime/archive/refs/tags/${pkgver}.zip"
        "${pkgname}.sh"
        "${pkgname}.desktop")
sha256sums=('cbfde4c192dee6a5f7bf2f8e975a87a3af01efc8acbf011fc0e17741726a894e'
          '2213caa4bb13f483b61a6ea57ee0f74394080505720d004a476ed10651150fc7'
          'e7c80c605000bedabb5cd0c415539288f2a3cc01246e84364dbdac2742a81414')

conflicts=(${pkgname}-git)

prepare() {
  mv "${srcdir}/FallingTime-${pkgver}" "${srcdir}/${pkgname}-${pkgver}"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cmake .
  make
}

package() {
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/COPYRIGHT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install "${srcdir}/${pkgname}-${pkgver}/falling_time" -Dm755 "${pkgdir}/opt/${pkgname}/${pkgname}"
  cp -r "${srcdir}/${pkgname}-${pkgver}/data" "${pkgdir}/opt/${pkgname}/"
  install "${startdir}/${pkgname}.sh" -Dm755 "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${startdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
