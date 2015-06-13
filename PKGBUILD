# Mantainer:  David Fabijan <mclenin.at.gmail.com>

pkgname=latexdraw
pkgver=3.3.1
pkgrel=1
pkgdesc='Create svg graphics and/or pstricks code usable in latex documents.'
arch=('any')
url="http://latexdraw.sourceforge.net"
license=('GPL2')
depends=('java-runtime>=7' 'desktop-file-utils')
optdepends=('texlive-pstricks: use generated code in latex documents')
source=(http://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgver}/LaTeXDraw-${pkgver}-bin.zip
        latexdraw.sh)
install=latexdraw.install
md5sums=('0d823f07c4b820cb439df46f5b08cd2f'
         '8f7e3de38675797b824c5a8878e4c694')

package() {
    cd ${srcdir}/LaTeXDraw-${pkgver}/data

    install -Dm755 LaTeXDraw.jar ${pkgdir}/usr/share/java/${pkgname}/LaTeXDraw.jar
    install -Dm755 lib/malai.swing-1.3.jar ${pkgdir}/usr/share/java/${pkgname}/lib/malai.swing-1.3.jar
    install -Dm755 lib/malai.core-1.3.jar ${pkgdir}/usr/share/java/${pkgname}/lib/malai.core-1.3.jar
    install -Dm755 lib/scala-library-2.11.2.jar ${pkgdir}/usr/share/java/${pkgname}/lib/scala-library-2.11.2.jar
    install -Dm755 lib/scala-parser-combinators_2.11-1.0.2.jar ${pkgdir}/usr/share/java/${pkgname}/lib/scala-parser-combinators_2.11-1.0.2.jar
    install -Dm755 lib/pdf-renderer-1.0.5.jar ${pkgdir}/usr/share/java/${pkgname}/lib/pdf-renderer-1.0.5.jar
    install -Dm755 lib/jlibeps-0.1.jar ${pkgdir}/usr/share/java/${pkgname}/lib/jlibeps-0.1.jar

    sed -i 's:Icon=/usr/share/latexdraw/images/app/latexdraw.png:Icon=latexdraw:' gnome/latexdraw.desktop

    install -Dm644 gnome/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
    install -Dm644  gnome/${pkgname}.png ${pkgdir}/usr/share/pixmaps/${pkgname}.png

    install -Dm644  templates/Classic\ grid.svg  ${pkgdir}//usr/share/latexdraw/templates/Classic\ grid.svg
    install -Dm644  templates/Condenser.svg  ${pkgdir}//usr/share/latexdraw/templates/Condenser.svg
    install -Dm644  templates/embrace.svg  ${pkgdir}//usr/share/latexdraw/templates/embrace.svg
    install -Dm644  templates/man.svg  ${pkgdir}//usr/share/latexdraw/templates/man.svg
    install -Dm644  templates/question.svg  ${pkgdir}//usr/share/latexdraw/templates/question.svg


    install -Dm755 ${srcdir}/${pkgname}.sh      ${pkgdir}/usr/bin/${pkgname}
    
    cd ${srcdir}/LaTeXDraw-${pkgver}/

    # NB readme stipulates release_note.txt license.txt must be installed
    # in same folder as executable jarfile
    install -Dm644  license.txt ${pkgdir}/usr/share/java/${pkgname}/license.txt
    install -Dm644  release_note.txt ${pkgdir}/usr/share/java/${pkgname}/release_note.txt

    

}
