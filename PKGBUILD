# Maintainer:  <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor:: pezcurrel <pezcurrel [at] tiscali.it>

pkgname=blockout2
pkgver=2.5
pkgrel=2
pkgdesc="3D tetris, free adaptation of the original BlockOut DOS game edited by California Dreams in 1989. Pre-compiled."
arch=("any")
url="http://www.blockout.net/blockout2/"
depends=("libgl" "glu" "libxext" "sdl" "sdl_mixer" "alsa-lib")
license=("GPL")
conflicts=("blockout2-bin")
source=(
  "http://downloads.sourceforge.net/project/blockout/blockout/BlockOut%202.5/bl25-src.tar.gz"
  "http://downloads.sourceforge.net/project/blockout/blockout/BlockOut%202.5/bl25-linux-x64.tar.gz"
  "blockout2"
  "blockout2.desktop"
  "blockout2.png"
)
md5sums=(
  "c68a6d6f1f42aa61dbce84b100f19351"
  "6155d0596d762852e3fbd1718d3d6455"
  "130e2c10b68b41bf12e67a764a2ea4fb"
  "c3d7d196e4af7fabd287376988376fe4"
  "166642ab949cd145f6126857a5ac7e4f"
)

build () {
  cd "${srcdir}/BL_SRC/ImageLib/src/"
  make
  cd "${srcdir}/BL_SRC/BlockOut/"
  make
} 

package() {
  install -d "${pkgdir}"/{opt/blockout2,usr/bin,usr/share/applications,usr/share/pixmaps}
  chmod -x "${srcdir}/blockout/images/background.png" "$srcdir"/blockout/sounds/music.ogg	
  mv "${srcdir}/BL_SRC/BlockOut/blockout" "${pkgdir}/opt/blockout2/"
  mv "${srcdir}/blockout/sounds" "${pkgdir}/opt/blockout2/"
  mv "${srcdir}/blockout/images" "${pkgdir}/opt/blockout2/"
	cp "${srcdir}/blockout2" "${pkgdir}/usr/bin/"
	cp "blockout2.desktop" "${pkgdir}/usr/share/applications/"
	cp "blockout2.png" "${pkgdir}/usr/share/pixmaps/"
}
