# Maintainer: Papajoker <papajoker [at] manjaro [dot] fr>
pkgname=pacnew-chaser
pkgver=0.9.5
pkgrel=1
url="https://www.manjaro.fr/forum/"
pkgdesc="finding .pacnew files, compare and load merge (qt) - dev version"
arch=('x86_64')
license=('GPL')
depends=('qt5pas')
optdepends=('diffuse: editor, compare merge files'
        'kompare: editor, compare merge files'
        'meld: editor, compare merge files')
source=("https://www.manjaro.fr/forum/datas/pacnew-chaser-qt.tar.gz")
#provide=('pacnew-chaser')
conflicts=('pacnew-chaser-gtk')
replaces=('pacnew-chaser-gtk')
#install='.install' 
md5sums=('139aa392c7524caba7d341e7473cb1ed')

package() {
  cd "$srcdir"
  install -Dm755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
  install -Dm755 pacnews "${pkgdir}/usr/lib/pacnews"
  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  mkdir -p "${pkgdir}/usr/share/polkit-1/actions/"
  for p in diffuse meld kompare rm ; do
    cp "policies/org.manjaro.fr.pacnew.${p}.policy" "${pkgdir}/usr/share/polkit-1/actions/"
  done
}
