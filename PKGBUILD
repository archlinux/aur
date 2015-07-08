# Maintainer: Vlad M. <vlad@archlinux.net>
# Contributor: Rax Garfield <admin at dvizho.ks.ua>

pkgname=hunspell-uk
pkgver=1.9.6
pkgrel=1
pkgdesc="Ukrainian spelling dictionary"
arch=('any')
url="http://extensions.libreoffice.org/extension-center/ukrainian-spelling-dictionary-and-thesaurus"
license=('LGPL3' 'GPL3')
groups=('dict-uk')
optdepends=('hunspell: the spell checking libraries and apps'
            'hyphen-uk: Ukrainian hyphenation rules'
            'mythes-uk: Ukrainian thesaurus')
source=("http://extensions.libreoffice.org/extension-center/ukrainian-spelling-dictionary-and-thesaurus/releases/${pkgver}/dict-uk_ua-${pkgver//./-}.oxt")
sha256sums=('526365ad178dd0bb829db11ea2cf21a3811e0f16a3a93d65c97b946240d9d4eb')

package() {
  cd ${srcdir}/uk_UA
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
