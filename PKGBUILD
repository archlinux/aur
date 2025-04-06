# Maintainer: Dario K <dkmr_main at hotmail dot com>
# Contributor: Miro Bezjak <bezjak.miro at gmail dot com>

pkgname=hunspell-hr
pkgver=2.1.20240828
pkgrel=1
pkgdesc="Croatian dictionary for Hunspell"
arch=("any")
url="https://github.com/krunose/hunspell-hr"
license=("LGPL-2.0-or-later" "LicenseRef-SISSL")
optdepends=("hunspell:	the spell checking libraries and apps")
_pkgver_tag="2.1-20240828"
source=(
  "hunspell-hr-${pkgver}.zip::https://github.com/krunose/hunspell-hr/archive/refs/tags/v${_pkgver_tag}.zip"
  "SISSL.txt::https://raw.githubusercontent.com/spdx/license-list-data/main/text/SISSL.txt"
)
md5sums=(
  "883ac6a89b027ed5cb776824319c2bac"
  "SKIP"
)

package() {
  cd "${srcdir}/hunspell-hr-${_pkgver_tag}"
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
  
  # install the SISSL license
  install -Dm644 "$srcdir/SISSL.txt" "$pkgdir/usr/share/licenses/${pkgname}/SISSL"
}
