# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributer: Uncle Hunto <unclehunto äτ ÝãΗ00 Ð0τ ÇÖΜ>
# Contributer: Limao Luo <luolimao+AUR@gmail.com>

pkgname="quad"
pkgver=1.12
pkgrel=7
pkgdesc="High-performance file compressor that utilizes an advanced LZ-based compression algorithm"
arch=(
  'i686'
  'x86_64'
)
url="https://quad.sourceforge.net"
license=(
  'LGPL-2.1-or-later'
)
depends=(
  'glibc'
)
_pkgsrc="${pkgname}${pkgver//.}src"
source=(
  "https://downloads.sourceforge.net/sourceforge/${pkgname}/${_pkgsrc}.zip"
)
noextract=(
  "${source[@]##*/}"
)
md5sums=('cbaf87a625615683e72b76c738a02dfe')
sha1sums=('d9a173279ac1a912279da0f3d4cb2c38ac0478dc')
sha256sums=('67e008e1ee6c164e711ababbbbddc0848e137b2fe73923f08c7b8b96bdff8c70')

prepare() {
  cd "${srcdir}"
  mkdir -p "${srcdir}/${_pkgsrc}"
  bsdtar -xzf "${source[0]##*/}" -C "${srcdir}/${_pkgsrc}"
}

build() {
  cd "${srcdir}/${_pkgsrc}"  
  g++ ${CFLAGS} ${LDFLAGS} -o "${pkgname}" "${pkgname}.cpp"
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vDm755 "${pkgname}"  "${pkgdir}/usr/bin/${pkgname}"
  install -vDm644 "README.TXT"  "${pkgdir}/usr/share/doc/${pkgname}/README.txt"
  install -vDm644 "COPYING.TXT" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.txt"
}
