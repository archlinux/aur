#Maintainer : Papajoke <papajoke [at] manjaro [dot] fr>
pkgname=pacnew-chaser
pkgver=0.9.15
pkgrel=2
url="https://www.manjaro.fr/forum/"
pkgdesc="manage .pacnew files, compare and merge (qt gui) - dev version"
arch=('x86_64')
license=('GPL')
depends=('qt5pas')
optdepends=('diffuse: editor, compare merge files'
        'kompare: editor, compare merge files'
        'meld: editor, compare merge files')
source=("https://www.manjaro.fr/forum/datas/pacnew-chaser-qt.tar.gz")
#provide=('pacnew-chaser')
#conflicts=('pacnew-chaser-gtk')
#replaces=('pacnew-chaser-gtk')
#install='.install' 
sha512sums=('0097164d8baf2e8f3d7d7d0949c3cba801c0e2152aeed159de98fb2c2fcc754de8b07d2703fa3d85cb111c2cdcf03758eee7181c3c5dd49e882bb048869a865b')

package() {
  cd "$srcdir"
  install -d ${pkgdir}{/usr/{bin,share/{applications,pixmaps,polkit-1/actions},lib/$pkgname},/etc}
  install -m755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -m644 lib/man.css "${pkgdir}/usr/lib/${pkgname}/man.css"
  install -m755 lib/pacnews "${pkgdir}/usr/lib/${pkgname}/pacnews"
  install -m644 "lib/${pkgname}.ini" "${pkgdir}/etc/${pkgname}.ini"
  install -m644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -m644 "images/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  #mkdir -p "${pkgdir}/usr/share/polkit-1/actions/"
  msg2 "install polkit policies"
  for p in diffuse meld kompare rm vscode ; do
    install -m644 "policies/org.manjaro.fr.pacnew.${p}.policy" "${pkgdir}/usr/share/polkit-1/actions/"
  done
}
