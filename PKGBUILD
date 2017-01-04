# Maintainer: Vlad M. <vlad@archlinux.net>
# Contributor: Rax Garfield <admin at dvizho.ks.ua>

pkgname=hunspell-uk
pkgver=3.5.1
pkgrel=1
pkgdesc="Ukrainian spelling dictionary"
arch=('any')
url='https://extensions.libreoffice.org/extensions/ukrainian-spelling-dictionary-and-thesaurus'
license=('LGPL' 'GPL' 'MPL')
groups=('dict-uk')
optdepends=('hunspell: the spell checking libraries and apps')
source=("https://extensions.libreoffice.org/extensions/ukrainian-spelling-dictionary-and-thesaurus/$pkgver/@@download/file/dict-uk_ua-${pkgver//./-}.oxt")
sha256sums=('6c91a4779850425f413588550282739488bad3299d1d087031f9c723c6ed8e99')

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
