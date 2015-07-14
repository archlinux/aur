# Contributor: Mladen Pejakovic <pejakm@gmail.com>

pkgname=optimfrog
pkgver=5.000
pkgrel=1
pkgdesc="A lossless audio compression program."
url="http://www.losslessaudio.org/"
license=('custom:OptimFROG')
arch=('i686' 'x86_64')
source_i686=(http://www.losslessaudio.org/Downloads/A1C0/${pkgver//./}/Linux/OptimFROG_Linux_x86_${pkgver//./}.zip)
source_x86_64=(http://www.losslessaudio.org/Downloads/A1C0/${pkgver//./}/Linux/OptimFROG_Linux_x64_${pkgver//./}.zip)
md5sums_i686=('fb30d687b8e7e01e70b278785017a5a1')
md5sums_x86_64=('3869232d16fb4641fe066e3aee23535e')

package() {
  [ "${CARCH}" = i686 ] && _arch=x86
  [ "${CARCH}" = x86_64 ] && _arch=x64
  cd "OptimFROG_Linux_${_arch}_${pkgver//./}"
  install -Dm755 off "${pkgdir}/usr/bin/off"
  install -Dm755 ofr "${pkgdir}/usr/bin/ofr"
  install -Dm755 ofr_sfx "${pkgdir}/usr/bin/ofr_sfx"
  install -Dm755 ofs "${pkgdir}/usr/bin/ofs"
  install -Dm755 SDK/Library/libOptimFROG.so "${pkgdir}/usr/lib/libOptimFROG.so"
  (cd SDK/OptimFROG; for i in $(find . -type f); do install -Dm644 "${i}" "${pkgdir}/usr/include/OptimFROG/${i}"; done)
  (cd SDK/Examples; for i in $(find . -type f); do install -Dm644 "${i}" "${pkgdir}/usr/share/OptimFROG/${i}"; done)
  (cd SDK/Documentation; for i in $(find . -type f); do install -Dm644 "${i}" "${pkgdir}/usr/share/OptimFROG/doc/${i}"; done)
  install -Dm644 license.html "${pkgdir}/usr/share/license/${pkgname}/license.html"
}
