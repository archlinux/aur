# Maintainer: Vlad M. <vlad@archlinux.net>
# Contributor: Rax Garfield <admin at dvizho.ks.ua>

pkgname=hunspell-uk
pkgver=3.6.0
pkgrel=1
pkgdesc="Ukrainian spelling dictionary"
arch=('any')
url='https://extensions.libreoffice.org/extensions/ukrainian-spelling-dictionary-and-thesaurus'
license=('LGPL' 'GPL' 'MPL')
groups=('dict-uk')
optdepends=('hunspell: the spell checking libraries and apps')
source=("https://extensions.libreoffice.org/extensions/ukrainian-spelling-dictionary-and-thesaurus/${pkgver/./-}/@@download/file/dict-uk_ua-$pkgver.oxt")
sha256sums=('b8f3c3d7aca750e67d1016cfb3bcfbea331a2bb8ba1c5767d441180e1cedc465')

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
