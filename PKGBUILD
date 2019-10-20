# Contributor: Olivier Mehani <shtrom-aur@ssji.net>
# Contributor: florianbw <florian.bw@gmail.com>
# vim:set ts=2 sw=2 et:

pkgname=latex-template-springer
pkgver=20191006
pkgrel=2
pkgdesc="Springer templates for LNCS proceedings (llncs), monographs (svmono), multiauthor volumes (svmult), journals (svjour3), and other lecture notes (svmultln)"
arch=('any')
url="https://www.springer.com/gp/computer-science/lncs/conference-proceedings-guidelines"
license=('')
groups=()
depends=('texlive-latex3')
makedepends=('unzip')
optdepends=()
provides=(latex-template-lncs)
conflicts=(latex-template-lncs)
replaces=(latex-template-lncs)
backup=()
options=()
install=texlive.install

SVJOUR3VER=240419

source=(ftp://ftp.springernature.com/cs-proceeding/llncs/llncs2e.zip
http://www.springer.com/cda/content/document/cda_downloaddocument/svmult.zip
http://www.springer.com/cda/content/document/cda_downloaddocument/svmono.zip
http://static.springer.com/sgw/documents/468198/application/zip/LaTeX_DL_468198_${SVJOUR3VER}.zip)

package() {
  for _SVJOUR3 in readme.txt svjour3.cls usrguid3.pdf svglov3.clo template.tex; do
    install -m 0644 -D ${srcdir}/LaTeX_DL_468198_${SVJOUR3VER}/${_SVJOUR3} ${pkgdir}/usr/share/texmf-dist/tex/latex/svjour3/${_SVJOUR3}
  done
  install -m 0644 -D ${srcdir}/LaTeX_DL_468198_${SVJOUR3VER}/spphys.bst ${pkgdir}/usr/share/texmf-dist/bibtex/bst/springer/spphys.bst

  for _SVMONO in instruct.pdf quickstart.pdf refguide.pdf styles/* templates/*; do
    [[ ${_SVMONO} == *"/*" ]] && install -m 755 -d ${pkgdir}/usr/share/texmf-dist/tex/latex/svmono/${_SVMONO#/*}
    install -m 0644 -D ${srcdir}/${_SVMONO} ${pkgdir}/usr/share/texmf-dist/tex/latex/svmono/${_SVMONO%\*}
  done

  for _SVMULT in instruct.pdf quickstart.pdf refguide.pdf styles/* templates/*; do
    [[ ${_SVMULT} == *"/*" ]] && install -m 755 -d ${pkgdir}/usr/share/texmf-dist/tex/latex/svmult/${_SVMULT#/*}
    install -m 0644 -D ${srcdir}/${_SVMULT} ${pkgdir}/usr/share/texmf-dist/tex/latex/svmult/${_SVMULT%\*}
  done

  for _LLNCS in readme.txt llncs.cls llncsdoc.pdf; do
    install -m 0644 -D ${srcdir}/${_LLNCS} ${pkgdir}/usr/share/texmf-dist/tex/latex/llncs/${_LLNCS}
  done
  install -m 0644 -D ${srcdir}/splncs04.bst ${pkgdir}/usr/share/texmf-dist/bibtex/bst/springer/splncs04.bst

  find ${pkgdir}/usr/share/texmf-dist/tex/latex/ -name \*.bst -exec mv {} ${pkgdir}/usr/share/texmf-dist/bibtex/bst/springer/ \;
  # XXX: BSTs have disappeared from the latest version of svmono... Go figure...
  #mv ${pkgdir}/usr/share/texmf-dist/tex/latex/svmono/*.bst \
  # ${pkgdir}/usr/share/texmf-dist/bibtex/bst/springer/
}

md5sums=('SKIP'
         'SKIP'
         'SKIP'
         '24a19fb349ad5a7d26f75070fd58e628')
