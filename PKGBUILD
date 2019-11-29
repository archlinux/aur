# Contributor: Olivier Mehani <shtrom-aur@ssji.net>
# Contributor: florianbw <florian.bw@gmail.com>
# vim:set ts=2 sw=2 et:

pkgname=latex-template-springer
pkgver=20191006
pkgrel=3
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

  install_tex svmono.zip svmono
  install_tex svmult.zip svmult
  install_tex llncs2e.zip llncs

  bstdir=${pkgdir}/usr/share/texmf-dist/bibtex/bst/springer/
  install -m 755 -d ${bstdir}
  find ${pkgdir}/usr/share/texmf-dist/tex/latex/ -name \*.bst -exec mv {} ${bstdir} \;
}

install_tex() {
  zipname=$1
  dirname=$2

  destdir=${pkgdir}/usr/share/texmf-dist/tex/latex/${dirname}/
  install -m 755 -d ${destdir}
  unzip ${srcdir}/${zipname} -d ${destdir}

}

md5sums=('SKIP'
         'SKIP'
         'SKIP'
         '24a19fb349ad5a7d26f75070fd58e628')
