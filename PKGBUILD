# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Mladen Pejakovic <pejakm@gmail.com>

pkgname=optimfrog
pkgver=5.003
pkgrel=1
pkgdesc="A lossless audio compression program."
url='http://www.losslessaudio.org'
license=('custom:OptimFROG')
arch=('i686' 'x86_64')
source_i686=(http://www.losslessaudio.org/Downloads/A1C0/${pkgver//./}/Linux/OptimFROG_Linux_x86_${pkgver//./}.zip)
source_x86_64=(http://www.losslessaudio.org/Downloads/A1C0/${pkgver//./}/Linux/OptimFROG_Linux_x64_${pkgver//./}.zip)
sha1sums_i686=("$(curl -s http://www.losslessaudio.org/Downloads/A1C0/${pkgver//./}/Linux/OptimFROG_Linux_x86_${pkgver//./}.zip.sha1 | cut -d ' ' -f1)")
sha1sums_x86_64=("$(curl -s http://www.losslessaudio.org/Downloads/A1C0/${pkgver//./}/Linux/OptimFROG_Linux_x64_${pkgver//./}.zip.sha1 | cut -d ' ' -f1)")

package() {
  [ "${CARCH}" = i686 ] && _arch=x86
  [ "${CARCH}" = x86_64 ] && _arch=x64
  cd "OptimFROG_Linux_${_arch}_${pkgver//./}"
  ./install.sh -d "${pkgdir}"
  (cd SDK/OptimFROG; for i in $(find . -type f); do install -Dm644 "${i}" "${pkgdir}/usr/include/OptimFROG/${i}"; done)
  (cd SDK/Examples; for i in $(find . -type f); do install -Dm644 "${i}" "${pkgdir}/usr/share/OptimFROG/${i}"; done)
  (cd SDK/Documentation; for i in $(find . -type f); do install -Dm644 "${i}" "${pkgdir}/usr/share/OptimFROG/doc/${i}"; done)
  install -Dm644 license.html "${pkgdir}/usr/share/licenses/${pkgname}/license.html"
}
