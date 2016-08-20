# Maintainer: Vlad M. <vlad@archlinux.net>
# Contributor: Rax Garfield <admin at dvizho.ks.ua>

pkgname=hunspell-uk
pkgver=2.9.1
pkgrel=1
pkgdesc="Ukrainian spelling dictionary"
arch=('any')
url="http://extensions.libreoffice.org/extension-center/ukrainian-spelling-dictionary-and-thesaurus"
license=('LGPL' 'GPL' 'MPL')
groups=('dict-uk')
optdepends=('hunspell: the spell checking libraries and apps')
source=("http://extensions.libreoffice.org/extension-center/ukrainian-spelling-dictionary-and-thesaurus/releases/${pkgver}/dict-uk_ua-${pkgver//./-}.oxt")
sha256sums=('940ec1f3111f4f71c976abd303500c86fc4ac8e51c74883f1e43ab30d81fbea9')

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
