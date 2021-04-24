# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Mladen Pejakovic <pejakm@gmail.com>

pkgname=optimfrog-bin
pkgver=5.100
pkgrel=1
pkgdesc="A lossless audio compression program."
url='http://www.losslessaudio.org'
license=('custom:OptimFROG')
arch=('x86_64')
provides=('optimfrog')
conflicts=('optimfrog')
source=("http://www.losslessaudio.org/Downloads/A1C0/${pkgver//./}/Linux/OptimFROG_Linux_x64_${pkgver//./}.zip")
sha1sums=("$(curl -s http://www.losslessaudio.org/Downloads/A1C0/${pkgver//./}/Linux/OptimFROG_Linux_x64_${pkgver//./}.zip.sha1 | cut -d ' ' -f1)")

package() {
  cd "OptimFROG_Linux_x64_${pkgver//./}"
  ./install.sh -d "${pkgdir}"
  (cd SDK/OptimFROG; for i in $(find . -type f); do install -Dm644 "${i}" "${pkgdir}/usr/include/OptimFROG/${i}"; done)
  (cd SDK/Examples; for i in $(find . -type f); do install -Dm644 "${i}" "${pkgdir}/usr/share/OptimFROG/${i}"; done)
  (cd SDK/Documentation; for i in $(find . -type f); do install -Dm644 "${i}" "${pkgdir}/usr/share/OptimFROG/doc/${i}"; done)
  install -Dm644 license.html "${pkgdir}/usr/share/licenses/${pkgname}/license.html"
}
