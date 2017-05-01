# Contributor: Jelle van der Waa <jelle@vdwaa.nl>
# Contributor: Urs Wolfer <uwolfer @ fwo.ch>
# Mainainer: bohoomil <@zoho.com>

pkgbase=ttf-droid-family-ib
pkgname=('ttf-droid-ib' 'ttf-droid-nonlatin-ib')
pkgver=20121017
pkgrel=12
pkgdesc="General-purpose fonts released by Google as part of Android. Includes additional monospaced variants with dotted and slashed zeros."
arch=('any')
license=('Apache')
url="http://code.google.com/android/"
groups=('infinality-bundle-fonts')
source=(https://sources.archlinux.org/other/community/ttf-droid/ttf-droid-20121017.tar.xz
        http://www.cosmix.org/software/files/DroidSansMonoSlashed.zip
        http://www.cosmix.org/software/files/DroidSansMonoDotted.zip
        45-droid.conf
        65-ttf-droid-sans.conf
        65-ttf-droid-serif.conf
        90-tt-droid.conf)

package_ttf-droid-ib(){
  pkgdesc="General-purpose fonts released by Google as part of Android. Includes additional monospaced variants with dotted and slashed zeros."
  depends=('fontconfig')
  conflicts=('ttf-droid' 'ttf-droid-monovar' 'ttf-droid-monovar-ib')
  replaces=('ttf-droid' 'ttf-droid-monovar' 'ttf-droid-monovar-ib')
  provides=('ttf-font' 'ttf-droid')

  cd "${srcdir}"/google-droid-fonts-"${pkgver}"

  _droid_base=(DroidSerif-Bold.ttf DroidSerif-BoldItalic.ttf DroidSerif-Italic.ttf DroidSerif-Regular.ttf DroidSans-Bold.ttf DroidSans.ttf DroidSansMono.ttf)

  install -d -m755 "${pkgdir}"/usr/share/fonts/"${pkgname}"

  for fnt in "${_droid_base[@]}"; do
    install -m644 "$fnt" "${pkgdir}"/usr/share/fonts/"${pkgname}"
  done

  install -m 644 ../*.ttf "${pkgdir}"/usr/share/fonts/"${pkgname}"

  cd "${srcdir}"
  install -d "${pkgdir}"/etc/fonts/conf.avail
  install -d "${pkgdir}"/etc/fonts/conf.d
  install -m644 45-droid.conf "${pkgdir}"/etc/fonts/conf.avail
  install -m644 65-ttf-droid-sans.conf "${pkgdir}"/etc/fonts/conf.avail
  install -m644 65-ttf-droid-serif.conf "${pkgdir}"/etc/fonts/conf.avail
  install -m644 90-tt-droid.conf "${pkgdir}"/etc/fonts/conf.avail

  cd "${pkgdir}"/etc/fonts/conf.d
  ln -s ../conf.avail/45-droid.conf .
  ln -s ../conf.avail/65-ttf-droid-sans.conf .
  ln -s ../conf.avail/65-ttf-droid-serif.conf .
  ln -s ../conf.avail/90-tt-droid.conf .
}

package_ttf-droid-nonlatin-ib(){
  pkgdesc="General-purpose fonts released by Google as part of Android. Non-Latin language support."
  depends=('fontconfig' 'ttf-droid-ib')

  cd "${srcdir}"/google-droid-fonts-"${pkgver}"

  _droid_nonlatin=(DroidKufi-Bold.ttf DroidKufi-Regular.ttf DroidNaskh-Bold.ttf DroidNaskh-Regular-SystemUI.ttf DroidNaskh-Regular.ttf DroidSansArabic.ttf DroidSansArmenian.ttf DroidSansDevanagari-Regular.ttf DroidSansEthiopic-Bold.ttf DroidSansEthiopic-Regular.ttf DroidSansFallback.ttf DroidSansFallbackFull.ttf DroidSansFallbackLegacy.ttf DroidSansGeorgian.ttf DroidSansHebrew-Bold.ttf DroidSansHebrew-Regular.ttf DroidSansJapanese.ttf DroidSansTamil-Bold.ttf DroidSansTamil-Regular.ttf DroidSansThai.ttf)

  install -d -m755 "${pkgdir}"/usr/share/fonts/"${pkgname}"

  for fnt in "${_droid_nonlatin[@]}"; do
    install -m644 "$fnt" "${pkgdir}"/usr/share/fonts/"${pkgname}"
  done
}

sha1sums=('4190b9c3a75766df2e4a8a1a38c4c1722c63e41b'
          '50c4ea8f89e9559086e63389eee2da8c8636500e'
          '842a341b1b79119418d26f406662a18d2264862e'
          '7aa504d19793ac0feda1882d1504fe0cd5cf7654'
          'a6d3cc79db9e3cc01aedf599691314499edae02d'
          '1d540e1d02740a3e2cfe56c6197dad8d317193ef'
          '28f080d48e90a7bb81cd659bdbf2a008bf864384')

