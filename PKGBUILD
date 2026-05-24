pkgname=medley-bin
pkgver=260521
pkgrel=1
pkgdesc='Interlisp programming environment'
arch=('x86_64')
url='https://interlisp.org/'
license=('MIT')
depends=('libbsd' 'libx11')
optdepends=('man-db: show help with medley --man'
            'perl: developer scripts'
            'tigervnc: VNC display mode support')
provides=('medley')
conflicts=('medley')
_medley_tag='medley-260521-db8a7f4a'
_maiko_tag='260319-9259716e'
_release="${_medley_tag#medley-}_${_maiko_tag}"
source=(
  "https://github.com/Interlisp/medley/releases/download/${_medley_tag}/medley-full-linux-x86_64-${_release}.tgz"
  "medley.sh"
  "medley-LICENSE::https://raw.githubusercontent.com/Interlisp/medley/${_medley_tag}/LICENSE"
  "maiko-LICENSE::https://raw.githubusercontent.com/Interlisp/maiko/maiko-${_maiko_tag}/LICENSE"
  "maiko-NOTICE::https://raw.githubusercontent.com/Interlisp/maiko/maiko-${_maiko_tag}/NOTICE"
)
sha256sums=('79ab6960f45561ebecae66a89482742081ffa151f05409f1683f388a1dd4f071'
            '8ca860d7bc93ff9ecedce44ad46e7fb934d7037b9b80d2b6dafb500880c87ed9'
            '8f008511a3fb13e72b3f994886bba2781af79dfe57a6a56496c7c5c5ecfd8766'
            '2ce0363740d15460535f78ae70ab96cbe00e1053e3a81346873b2f7dfb877ced'
            '28fd0f03d8b2e976ea7bbfe103ac15c1a1a3bc7b8a0626b9141342205da7bba0')

package() {
  local libdir="${pkgdir}/usr/lib/interlisp"

  install -d "${libdir}" "${pkgdir}/usr/bin" "${pkgdir}/usr/share/man/man1" \
    "${pkgdir}/usr/share/licenses/${pkgname}"

  cp -a "${srcdir}/maiko" "${srcdir}/medley" "${srcdir}/notecards" "${libdir}/"

  install -Dm755 "${srcdir}/medley.sh" "${pkgdir}/usr/bin/medley"
  ln -s /usr/lib/interlisp/medley/docs/man-page/medley.1.gz \
    "${pkgdir}/usr/share/man/man1/medley.1.gz"

  install -Dm644 "${srcdir}/medley-LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.medley"
  install -Dm644 "${srcdir}/maiko-LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.maiko"
  install -Dm644 "${srcdir}/maiko-NOTICE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE.maiko"
}
