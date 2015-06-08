# Contributor: Evgeniy Alekseev <arcanis.arch at gmail dot com>
# Contributor: Matt Harrison <matt at mistbyte dot com>
# Contributor: Muhammad Qadri <Muhammad dot A dot Qadri at gmail dot com>
# This PKGBUILD is maintained at https://github.com/matt-h/aur-pkgbuilds/tree/master/voxforge-am-julius

pkgname=voxforge-am-julius-nightly
pkgver=20140604
pkgrel=1
pkgdesc="Acoustic model information for use with Julius voice recognition software"
arch=('any')
conflicts=(voxforge-am-julius)
provides=(voxforge-am-julius)
replaces=(voxforge-am-julius)
url="http://www.voxforge.org/"
license=('GPL')
pkgver() {
  printf $(($(date +%Y%m%d)-1))
}
_build_date=$(pkgver | cut -c1-4)-$(pkgver | cut -c5-6)-$(pkgver | cut -c7-8)
source=("julius-acousticmodel.tgz")
true && source=("julius-acousticmodel.tgz::http://www.repository.voxforge1.org/downloads/Nightly_Builds/AcousticModel-${_build_date}/Julius-4.2-Quickstart-Linux_AcousticModel-${_build_date}.tgz")
install=${pkgname}.install
md5sums=('SKIP')

package() {
  cd "${srcdir}"
  
  install -Dm644 "Sample.jconf" "${pkgdir}/usr/share/voxforge/julius/julius.jconf"
  install -dm755 "${pkgdir}/usr/share/voxforge/julius/grammar/"
  install -m644 -t "${pkgdir}/usr/share/voxforge/julius/grammar/" "grammar/"*
  install -dm755 "${pkgdir}/usr/share/voxforge/julius/acoustic_model_files/"
  install -m644 -t "${pkgdir}/usr/share/voxforge/julius/acoustic_model_files/" "acoustic_model_files/"*
  
  # remove license files
  rm "${pkgdir}/usr/share/voxforge/julius/"{acoustic_model_files,grammar}/LICENSE
}

# vim:set ts=2 sw=2 et:
