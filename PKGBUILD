# Maintainer: Henrique Custódio <henriqueffc at tutanota dot com>
# Contributor: Pedro Gabriel Drumond Pereira <pedrogabriel at dcc.ufmg.br>
# Contributor: Rafael D Martins <raziel_takato at hotmail dotcom>
# Contributor: Daniel Felipe Reis Apolinario <dapolinario at gmail dotcom>
# Contributor: Bernardo Barros <bernardobarros at gmail dotcom>
# Contributor: Robson R S Peixoto <robsonpeixoto at gmail dotcom>

pkgname=hunspell-pt-br
pkgver=3.2.15
pkgrel=3
pkgdesc="Brazillian Portuguese grammar, spelling and hyphenation checker to hunspell"
arch=(any)
url="http://pt-br.libreoffice.org/projetos/vero"
license=('LGPL3' 'MPL')
optdepends=('hunspell:  the spell checking libraries and apps')
source=('https://web.archive.org/web/20260219135127/https://pt-br.libreoffice.org/assets/Uploads/PT-BR-Documents/VERO/VeroptBR3215AOC.oxt')
sha256sums=('7571a3d8aaa0d5699f8b572d2fc613189876fa4fa87dcbda9a99bd63500210ee')

#based it in the community build for hunspell-hu-HU
package() {
  cd "$srcdir"
  install -dm755 ${pkgdir}/usr/share/hunspell
  install -m644 -t $pkgdir/usr/share/hunspell pt_BR.dic pt_BR.aff

  # the symlinks
  install -dm755 ${pkgdir}/usr/share/myspell/dicts
  pushd $pkgdir/usr/share/myspell/dicts
     for file in $pkgdir/usr/share/hunspell/*; do
       ln -sv /usr/share/hunspell/$(basename $file) .
     done
  popd

  # docs
  install -Dm644 README_pt_BR.txt $pkgdir/usr/share/doc/$pkgname/README_pt_BR.txt
}
