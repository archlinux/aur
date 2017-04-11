# Maintainer: Vlad M. <vlad@archlinux.net>
# Contributor: Rax Garfield <admin at dvizho.ks.ua>

pkgname=hunspell-uk
pkgver=3.7.3
pkgrel=1
pkgdesc="Ukrainian spelling dictionary"
arch=('any')
url='https://extensions.libreoffice.org/extensions/ukrainian-spelling-dictionary-and-thesaurus'
license=('MPL')
groups=('dict-uk')
optdepends=('hunspell: the spell checking libraries and apps')
source=("https://extensions.libreoffice.org/extensions/ukrainian-spelling-dictionary-and-thesaurus/${pkgver/./-}/@@download/file/dict-uk_ua-$pkgver.oxt")
sha256sums=('0437abb02ce44d3aca210842a431bbe6208f4d5380fbde85cb23c176d69da254')

package() {
  cd uk_UA
  install -dm755 ${pkgdir}/usr/share/hunspell
  install -m644 uk_UA.* ${pkgdir}/usr/share/hunspell

  # symlinks
  install -dm755 ${pkgdir}/usr/share/myspell/dicts
  pushd ${pkgdir}/usr/share/myspell/dicts
    for file in ${pkgdir}/usr/share/hunspell/*; do
      ln -sv /usr/share/hunspell/$(basename ${file}) .
    done
  popd

  # docs
  install -dm755 ${pkgdir}/usr/share/doc/${pkgname}
  install -m644 README_uk_UA.txt ${pkgdir}/usr/share/doc/${pkgname}
}
