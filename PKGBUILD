# Maintainer:  David Fabijan <mclenin.at.gmail.com>

pkgname=latexdraw
pkgver=3.3.9
pkgrel=1
pkgdesc='Create svg graphics and/or pstricks code usable in latex documents.'
arch=('any')
url="http://latexdraw.sourceforge.net"
license=('GPL2')
depends=('java-runtime>=8' 'desktop-file-utils')
optdepends=('texlive-pstricks: use generated code in LaTeX documents'
 'texlive-latexextra: support for LaTeX text in preview'
  'texlive-langcyrillic: support LaTeX renderig')
source=(http://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgver}/LaTeXDraw-${pkgver}-bin.zip
        latexdraw.sh)

package() {
    cd ${srcdir}/LaTeXDraw-${pkgver}/data

    install -Dm755 LaTeXDraw.jar ${pkgdir}/usr/share/java/${pkgname}/LaTeXDraw.jar
    install -d ${pkgdir}/usr/share/java/${pkgname}/lib/
    install -Dm755 lib/*.jar ${pkgdir}/usr/share/java/${pkgname}/lib/

    sed -i 's:Icon=/usr/share/latexdraw/images/app/latexdraw.png:Icon=latexdraw:' gnome/latexdraw.desktop

    install -Dm644 gnome/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
    install -Dm644  gnome/${pkgname}.png ${pkgdir}/usr/share/pixmaps/${pkgname}.png

    install -d ${pkgdir}/usr/share/latexdraw/templates/
    install -Dm644  templates/*.svg  ${pkgdir}/usr/share/latexdraw/templates/

    install -Dm755 ${srcdir}/${pkgname}.sh      ${pkgdir}/usr/bin/${pkgname}
    
    cd ${srcdir}/LaTeXDraw-${pkgver}/

    # NB readme stipulates release_note.txt license.txt must be installed
    # in same folder as executable jarfile
    install -Dm644  license.txt ${pkgdir}/usr/share/java/${pkgname}/license.txt
    install -Dm644  release_note.txt ${pkgdir}/usr/share/java/${pkgname}/release_note.txt

    

}
md5sums=('4e1be2f42dc5c666db1adb4e975d014d'
         '8f7e3de38675797b824c5a8878e4c694')
sha1sums=('6b38e2c3ddeacbe543d4fa370d3dd22408d79318'
          'd53cc9f75f931eaee25de1d421aeadbd2b2f1623')
sha256sums=('ddd3e5aea13203b8f295d7033fa88f40cedc3e32a3887a9025df82e935cf7cef'
            '341de73de077f2a85a79084a07a535a5dc399f19f873f8e54c2f000d7380f98b')
