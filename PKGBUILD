# Maintainer: dreieck (https://aur.archlinux.org/account/dreieck)

pkgbase="siedler2-data"
pkgname=(
  "siedler2-data"
  "siedler2-doc"
)
pkgdesc="Game data files and manual of Blue Byte's 'Siedler II'/'Settlers II' to be used with 'Return to the Roots'."
url='http://archive.org/details/die_siedler_2_151'
arch=('any')
pkgver='venividivici_gold'
pkgrel=12
license=('custom: proprietary')
options+=('emptydirs')

source=(
  'siedler2-gold.zip::http://archive.org/download/die_siedler_2_151/siedler2.zip'
  'The_Settlers_II_Manual.pdf::http://archive.org/download/The_Settlers_II_Manual/The_Settlers_II_Manual.pdf'
  'license-note.txt'
)

sha256sums=(
  'f4551e73244a1728046a8a6967ec1e95ab027bd1d91cc1b5cb404ac19a6dd27c'
  '7cf3c1d06343fabb393bd6de6b3f36d5ba3203b632043ce455ccc2ce5dda9925'
  '8c8856ab1e27c6a060f9a8aa4dc990e34c30a0bc1ea96028c2d73d9ef4aabac3'
)


package_siedler2-data() {
  pkgdesc="Game data files of Blue Byte's 'Siedler II'/'Settlers II' to be used with 'Return to the Roots'. Maps can also be played with 'widelands'."
  optdepends+=(
    "return-to-the-roots: To play the game."
    "widelands-maps-siedler2: To play the maps in the game 'widelands' (some things might not work correctly)."
    "siedler2-doc: The original Blue Byte manual."
  )
  provides=(
    "settlers2-data=${pkgver}"
    "settlers2-maps=${pkgver}"
    "siedler2-maps=${pkgver}"
  )

  cd "${srcdir}"
  install -v -m 755 -d "${pkgdir}/usr/share/s25rttr/S2"
  cp -av "${srcdir}"/{DATA,GFX} "${pkgdir}/usr/share/s25rttr/S2"/
  chmod -R a+Xr "${pkgdir}/usr/share/s25rttr/S2"/*

  install -v -D -m644 "${srcdir}/license-note.txt" "${pkgdir}/usr/share/licenses/${pkgname}/license-note.txt"
}

package_siedler2-doc() {
  pkgdesc="Manual for Blue Byte's 'Siedler II'/'Settlers II'."
  url='http://archive.org/details/The_Settlers_II_Manual/'

  install -v -D -m644 "${srcdir}/The_Settlers_II_Manual.pdf" "${pkgdir}/usr/share/doc/siedler2/The_Settlers_II_Manual.pdf"

  install -v -D -m644 "${srcdir}/license-note.txt" "${pkgdir}/usr/share/licenses/${pkgname}/license-note.txt"
}
