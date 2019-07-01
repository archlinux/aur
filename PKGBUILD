# Maintainer: Miro Bezjak <bezjak.miro at gmail dot com>
# based upon: https://aur.archlinux.org/packages/hunspell-bg/

pkgname=hunspell-hr
pkgver=1.0
pkgrel=1
pkgdesc='Croatian dictionary for Hunspell'
arch=('any')
url="https://github.com/krunose/hunspell-hr"
license=('MIT', 'LGPL/SISSL')
optdepends=('hunspell:	the spell checking libraries and apps')
source=('https://github.com/krunose/hunspell-hr/archive/9ae404a8840fe9525deea22ef0a8fd95948fd544.zip')
md5sums=('74b7536617a62455c5f8625d3463f581')

package() {
  cd "${srcdir}"/hunspell-hr-*
  install -dm755 ${pkgdir}/usr/share/hunspell

  install -m644 hr_HR.dic ${pkgdir}/usr/share/hunspell/hr_HR.dic
  install -m644 hr_HR.aff ${pkgdir}/usr/share/hunspell/hr_HR.aff

  # the symlinks
  install -dm755 ${pkgdir}/usr/share/myspell/dicts
  pushd ${pkgdir}/usr/share/myspell/dicts
    for file in ${pkgdir}/usr/share/hunspell/*; do
      ln -sv /usr/share/hunspell/$(basename ${file}) .
    done
  popd

  # docs
  install -dm755 ${pkgdir}/usr/share/doc/${pkgname}
  install -m644 README_hr_HR.txt ${pkgdir}/usr/share/doc/${pkgname}/
}
