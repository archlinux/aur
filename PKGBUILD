#Maintainer : Papajoke <papajoke [at] manjaro [dot] fr>
pkgname=pacnew-chaser
pkgver=0.9.22
pkgrel=1
url="https://www.manjaro.fr/forum/viewtopic.php?f=28&t=10284"
pkgdesc="manage .pacnew files, compare and merge (qt gui) - dev version"
arch=('x86_64')
license=('GPL')
install=.install
depends=('qt5pas' 'git')
optdepends=('diffuse: editor, compare merge files'
        'kompare: editor, compare merge files'
        'meld: editor, compare merge files')
source=("https://www.manjaro.fr/forum/datas/pacnew-chaser-qt-${pkgver}.tar.gz")
sha512sums=('bedc05b8e98b243aaf68a88a45d20d1a6215f19360e54828f65d82eef5919218239da1f420c97afbe64e39e784992f075a769e3e983eb0e46a34937a082af82d')

package() {
  #cd "$srcdir"
  install -d ${pkgdir}{/usr/{bin,share/{applications,pixmaps,polkit-1/actions,locale/fr/LC_MESSAGES,mime/packages},lib/$pkgname},/etc}
  install -m755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -m644 lib/man.css "${pkgdir}/usr/lib/${pkgname}/man.css"
  install -m755 lib/pacnews "${pkgdir}/usr/lib/${pkgname}/pacnews"
  install -m644 "lib/${pkgname}.hook" "${pkgdir}/usr/lib/${pkgname}/${pkgname}.hook"
  install -m644 "lib/${pkgname}.xml" "${pkgdir}/usr/share/mime/packages/${pkgname}.xml"
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
