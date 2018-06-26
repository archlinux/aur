#Maintainer : Papajoke <papajoke [at] manjaro [dot] fr>
pkgname=pacnew-chaser
pkgver=0.9.17
pkgrel=1
url="https://www.manjaro.fr/forum/"
pkgdesc="manage .pacnew files, compare and merge (qt gui) - dev version"
arch=('x86_64')
license=('GPL')
depends=('qt5pas')
optdepends=('diffuse: editor, compare merge files'
        'kompare: editor, compare merge files'
        'meld: editor, compare merge files')
source=("https://www.manjaro.fr/forum/datas/pacnew-chaser-qt-${pkgver}.tar.gz")
sha512sums=('e27b1420a2247083f15c3c976d8fb3dbe581bf35f4bb54ca9753402fcfdde7b2d2702a43fff47e368a5de4a9029429d1b02c050a9391ddbb2faf9361f5337b1b')

package() {
  cd "$srcdir"
  install -d ${pkgdir}{/usr/{bin,share/{applications,pixmaps,polkit-1/actions,locale/fr/LC_MESSAGES},lib/$pkgname},/etc}
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
  msg2 "install locales"
  for p in fr ; do
    cp "languages/${pkgname}.${p}.po" "${pkgdir}/usr/share/locale/${p}/LC_MESSAGES/${pkgname}.po"
    [ -f "languages/lclstrconsts.${p}.po" ] && cp "languages/lclstrconsts.${p}.po" "${pkgdir}/usr/share/locale/${p}/LC_MESSAGES/lclstrconsts.po"
  done
}
