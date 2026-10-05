# Maintainer: Anton Karmanov <a.karmanov@inventati.org>
# Based on hunspell-ru package

pkgname='hunspell-si'
# To find the latest commit for sources in libreoffice/dictionaries repo:
#   $ git log -1 -- si_LK/si_LK.*
pkgver='2012.09.01'
_commit='a4473e06b56bfe35187e302754f6baaa8d75e54f'
pkgrel=2  # TODO Remember to drop to 1 on version change
pkgdesc='Sinhala dictionary for Hunspell'
arch=('any')
url='https://github.com/LibreOffice/dictionaries'
_src_url="https://raw.githubusercontent.com/LibreOffice/dictionaries"
license=('GPL3')
optdepends=('hunspell: the spell checking libraries and apps')
provides=('hunspell-dictionary')
source=(
  "${pkgname}-${pkgver}.aff::${_src_url}/${_commit}/si_LK/si_LK.aff"
  "${pkgname}-${pkgver}.dic::${_src_url}/${_commit}/si_LK/si_LK.dic"
)
b2sums=(
  'aabca563c98074dc7d1c75331d1faec55e92543c169d821cba600c53497bccb938c6ad5c545d8632925398c6a1eb865377a6b2bcf5ac45de4119e2ff9100c1e1'
  'deceaa13d683543bc40d1c66dbf52b7f47e0da9377a591ab580b201a1597f2cffe851de34c402bbf23bfff0097b9bf42cf8b3c6804141dc52186c2448fdefff9'
)

package() {
  install -vdm755 "${pkgdir}/usr/share/hunspell"
  for suf in aff dic; do
    install -vDm644 "${pkgname}-${pkgver}.${suf}" "${pkgdir}/usr/share/hunspell/si_LK.${suf}"
  done

  install -dm755 "${pkgdir}/usr/share/myspell/dicts"
  for file in "${pkgdir}/usr/share/hunspell/"*; do
    ln -sv "/usr/share/hunspell/$(basename "$file")" "${pkgdir}/usr/share/myspell/dicts/"
  done
}
