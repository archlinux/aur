# Maintainer: Rax Garfield <admin at dvizho.ks.ua>

pkgname=hunspell-uk
pkgver=1.6.5
pkgrel=2
pkgdesc="Ukrainian spelling dictionary"
arch=('any')
url="http://extensions.libreoffice.org/extension-center/ukrainian-spelling-dictionary-and-thesaurus"
license=('LGPL3' 'GPL3')
groups=('dict-uk')
optdepends=(
	'hunspell: the spell checking libraries and apps'
	'hyphen-uk: Ukrainian hyphenation rules'
	'mythes-uk: Ukrainian thesaurus'
)
source=(http://extensions.libreoffice.org/extension-center/ukrainian-spelling-dictionary-and-thesaurus/releases/1.6.5/dict-uk_ua-1.6.5.oxt)
md5sums=('30746735548944edf5f4c9ef6881c510')

package() {
  cd ${srcdir}/uk_UA
  install -dm755 ${pkgdir}/usr/share/hunspell
  install -m 644 uk_UA.* ${pkgdir}/usr/share/hunspell

  # symlinks
  install -dm755 ${pkgdir}/usr/share/myspell/dicts
  pushd ${pkgdir}/usr/share/myspell/dicts
    for file in ${pkgdir}/usr/share/hunspell/*; do
      ln -sv /usr/share/hunspell/$(basename ${file}) .
    done
  popd

  # docs
  install -dm755 ${pkgdir}/usr/share/doc/${pkgname}
  install -m 644 README_uk_UA.txt ${pkgdir}/usr/share/doc/${pkgname}
}
