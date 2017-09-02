# Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=gigalomania
pkgver=0.28
pkgrel=1
pkgdesc="2D real time strategy game that is a clone of Mega-Lo-Mania"
arch=('i686' 'x86_64')
url="http://homepage.ntlworld.com/mark.harman/comp_gigalomania.html"
license=('GPL')
depends=('sdl2' 'sdl2_image' 'sdl2_mixer')
source=(http://launchpad.net/gigalomania/trunk/${pkgver}/+download/gigalomaniasrc.zip)
sha512sums=('e89a3aab737633e03be6fd82d36b992dbe00b0ecb5cd8b8c3f6ee9196fbcdf3dec0d181af29dcaeda2180e9037c14f770cb7cfb75f09c5b0d78d259532660d41')

build() {
  cd ${srcdir}/${pkgname}src

  # patch .desktop files
  sed 's#/opt/gigalomania/gigalomania#/usr/bin/gigalomania#g' -i gigalomania.desktop
  sed 's#/opt/gigalomania/#/usr/share/gigalomania/#g' -i gigalomania.desktop

  make
}

package() {
  cd "${srcdir}/${pkgname}src"

  # install the executable
  install -Dm 755 gigalomania "${pkgdir}/usr/bin/gigalomania"

  # create the mods and maps directory
  install -dm755 "${pkgdir}/usr/share/gigalomania/gfx"
  install -dm755 "${pkgdir}/usr/share/gigalomania/islands"
  install -dm755 "${pkgdir}/usr/share/gigalomania/sound"

  # install the data files
  install -Dm644 gfx/* "${pkgdir}/usr/share/gigalomania/gfx/"
  install -Dm644 islands/* "${pkgdir}/usr/share/gigalomania/islands/"
  install -Dm644 sound/* "${pkgdir}/usr/share/gigalomania/sound/"

  # install .desktop
  install -Dm 644 gigalomania.desktop "${pkgdir}/usr/share/applications/gigalomania.desktop"

  # install icon
  install -dm755 "${pkgdir}/usr/share/icons/hicolor/64x64/apps"
  install -Dm 644 gigalomania64.png "${pkgdir}/usr/share/icons/hicolor/64x64/apps/gigalomania64.png"
}

