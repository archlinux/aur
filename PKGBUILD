# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Army
# Contributor: Eric Le Bras <eric.lebras@gmail.com>

pkgname="aaphoto"
_commit_rel="581b3fad60382bdd36356155112559f731e31be3" # 0.45
_commit="ad4fc3c04b9e25212d78c231e1507458dfea8909" # r3
pkgver="0.45+r3+g${_commit::7}"
pkgrel=1
pkgdesc="Automatic photo adjusting"
arch=('i686' 'x86_64')
url="https://github.com/log69/${pkgname}"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc' 'libjpeg' 'libpng') # 'jasper'
_pkgsrc="${pkgname}-${_commit}"
source=("${_pkgsrc}.tar.gz::${url}/archive/${_commit}.tar.gz")
sha256sums=('6c4b5174b116106b61c3f9487e4122947c0d62a028c0d433a3f92af1880dbe59')

build() {
  cd "${srcdir}/${_pkgsrc}"
  autoreconf -vfi
  ./configure \
    --prefix='/usr'
  make
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  make DESTDIR="${pkgdir}" install

  install -vDm644 "AUTHORS"   "${pkgdir}/usr/share/doc/${pkgname}/AUTHORS"
  install -vDm644 "ChangeLog" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG"
  install -vDm644 "NEWS"      "${pkgdir}/usr/share/doc/${pkgname}/NEWS"
  install -vDm644 "README"    "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -vDm644 "REMARKS"   "${pkgdir}/usr/share/doc/${pkgname}/REMARKS"
  install -vDm644 "COPYING"   "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  install -vDm644 "COPYRIGHT" "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"
}
