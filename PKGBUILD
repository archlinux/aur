# Maintainer: Alexis Couronne <alexis@skitoo.net>

# I maintain this on Github, feel free to submit a pull request to
# https://github.com/skitoo/magicavoxel-archlinux.git

pkgname=magicavoxel
pkgver=0.98.2
pkgrel=1
pkgdesc='A free lightweight 8-bit voxel editor and interactive path tracing renderer, enjoy :)'
arch=('any')
url="http://ephtracy.github.io/"
source=("http://192.241.207.218/uploads/MagicaVoxel-${pkgver}-win.zip"
        "http://ephtracy.github.io/favicon.png"
        "magicavoxel"
        "magicavoxel.desktop"
        )
license=("Feel free to use it for any project, no commercial licences required, credits are appreciated")
depends=(wine)
makedepends=(unzip)
noextract=("MagicaVoxel-${pkgver}-win.zip")
md5sums=('97d6dc76fdb02bd4b77bfb1c38a648eb'
         '64ba6d1187827aa3ff3577c9ef9419fc'
         'f4c23c8e58253215628e3c0acd14522e'
         'd6c5be935d1588955be51ffbb2c1516b')

build () {
  unzip -o "MagicaVoxel-${pkgver}-win.zip"
}

package () {
  install -dm755 "${pkgdir}/usr/share/magicavoxel"
  cp -ra "${srcdir}/MagicaVoxel-${pkgver}-win/." "${pkgdir}/usr/share/magicavoxel"
  install -m644 favicon.png "${pkgdir}/usr/share/magicavoxel.png"
  install -dm755 "${pkgdir}/usr/bin"
  install -m755 magicavoxel "${pkgdir}/usr/bin"
  install -dm755 "${pkgdir}/usr/share/applications"
  install -m644 magicavoxel.desktop "${pkgdir}/usr/share/applications/magicavoxel.desktop"
  install -dm755 "${pkgdir}/usr/share/icons/hicolor/256x256/apps"
  install -m644 favicon.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/magicavoxel.png"
}

post_install() {
  update-desktop-database -q
  xdg-icon-resource forceupdate --theme hicolor &>/dev/null
}
