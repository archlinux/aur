# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributer: Uncle Hunto <unclehunto äτ ÝãΗ00 Ð0τ ÇÖΜ>
# Contributer: Limao Luo <luolimao+AUR@gmail.com>

pkgname="quad"
pkgver=1.12
pkgrel=7
pkgdesc="High-performance file compressor that utilizes an advanced LZ-based compression algorithm"
arch=('x86_64' 'i686')
url="https://${pkgname}.sourceforge.net"
license=('LGPL-2.1-or-later')
depends=('glibc')
_pkgsrc="${pkgname}-${pkgver}"
noextract=("${_pkgsrc}.zip")
source=("${_pkgsrc}.zip::https://downloads.sourceforge.net/sourceforge/${pkgname}/${_pkgsrc//[-.]/}src.zip")
sha256sums=('67e008e1ee6c164e711ababbbbddc0848e137b2fe73923f08c7b8b96bdff8c70')

prepare() {
  cd "${srcdir}"
  mkdir -p "${srcdir}/${_pkgsrc}"
  bsdtar -xzf "${_pkgsrc}.zip" -C "${srcdir}/${_pkgsrc}"
}

build() {
  cd "${srcdir}/${_pkgsrc}"  
  g++ ${CFLAGS} ${LDFLAGS} -o "${pkgname}" "${pkgname}.cpp"
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -Dm755 "${pkgname}"  "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "README.TXT"  "${pkgdir}/usr/share/doc/${pkgname}/README.txt"
  install -Dm644 "COPYING.TXT" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.txt"
}
