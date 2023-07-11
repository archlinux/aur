# Maintainer: dreieck

_pkgname="icc-hp-x520"
pkgname="${_pkgname}"
pkgver=2023_07
pkgrel=1
pkgdesc="ICM profiles for HP‌ PhotoSmart 5520, 6520 and 7520 printers"
arch=('any')
url="https://www.redrivercatalog.com/profiles/hp-photosmart-6520-7520-icc-color-printer-profiles.html"
license=('Custom')
source=(
  "https://www.redrivercatalog.com/profiles/hp-x520/rr-all-hp-x520-series.zip"
  "copyright.txt"
)
sha256sums=(
  '2bf98b53f75f685286228afe19a9e1146ab41bf611c0b44e0f4bebd6b31ee6bc'
  'e4019ad406f496e4c25d74781d5c8f723a8047704c4da3bb15f9c27428fea2ae'
)

package() {
  if stat --printf='' "${srcdir}"/*.icm 2>/dev/null; then
    for _profile in "${srcdir}"/*.icm; do
      install -D -v -m644 "${_profile}" "${pkgdir}/usr/share/color/icc/hp-x520/$(basename "${_profile}" .icm).icc"
    done
  fi
  if stat --printf='' "${srcdir}"/*.icc 2>/dev/null; then
    for _profile in "${srcdir}"/*.icc; do
      install -D -v -m644 "${_profile}" "${pkgdir}/usr/share/color/icc/hp-x520/$(basename "${_profile}")"
    done
  fi
  install -D -v -m644 "${srcdir}/profile-instructions-all.pdf" "${pkgdir}/usr/share/doc/${_pkgname}/profile-instructions-all.pdf"
  install -D -v -m644 "${srcdir}/copyright.txt" "${pkgdir}/usr/share/licenses/${pkgname}/copyright.txt"
}
