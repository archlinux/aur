# Maintainer: uint2048_t
pkgname=wipeout-rewrite-git
pkgver=1.0
pkgrel=1
pkgdesc="A re-implementation of the 1995 PSX game wipEout"
arch=(x86_64)
url="https://github.com/phoboslab/wipeout-rewrite"
license=(custom)

depends=(sdl2 glew)
         
makedepends=(make gcc git)
             
source=("git+https://github.com/phoboslab/wipeout-rewrite.git"
	"https://phoboslab.org/files/wipeout-data-v01.zip"
	"wipeout.png"
        "wipeout.desktop")

sha256sums=('SKIP'
	    '5bc02de7118a62a5cb8b4d0ec79062cddbe20ced86dda594df8a10c455f90ad1'
            '9374b04f78bd925661decd8cc8832598d7c53e6f477f71edd5eee02d6f09a3e5'
            '32343d744be32a80fa3cd44f8318a974a01cbb15beee03e29c85a082d707e496')

build() {
  cd wipeout-rewrite
  make sdl
}

package() {
  mkdir -pv "${pkgdir}/opt/wipeout-rewrite/"
  install -Dm755 "wipeout-rewrite/wipegame" "${pkgdir}/opt/wipeout-rewrite"
  cp -rv "wipeout" "${pkgdir}/opt/wipeout-rewrite"
  chmod -v 777 "${pkgdir}/opt/wipeout-rewrite"
  for _size in "192x192" "128x128" "96x96" "64x64" "48x48" "32x32" "24x24" "22x22" "20x20" "16x16" "8x8"
  do
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/${_size}/apps"
    convert "${srcdir}/wipeout.png" -resize "${_size}" "${pkgdir}/usr/share/icons/hicolor/${_size}/apps/wipeout.png"
  done
  install -Dm644 "${srcdir}/wipeout.desktop" "${pkgdir}/usr/share/applications/wipeout.desktop"
}
