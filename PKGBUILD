# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Army
# Contributor: Eric Le Bras <eric.lebras@gmail.com>

pkgname="aaphoto"
_commit_rel="581b3fad60382bdd36356155112559f731e31be3" # 0.45
_commit="ad4fc3c04b9e25212d78c231e1507458dfea8909" # r3
pkgver="0.45+r3+g${_commit::7}"
pkgrel=2
pkgdesc="Automatic photo adjusting"
arch=(
  'i686'
  'x86_64'
)
url="https://github.com/log69/${pkgname}"
license=(
  'GPL-3.0-or-later'
)
depends=(
  'glibc'
  'libgomp'
  'libjpeg-turbo'
  'libpng'
  # 'jasper'
)
_pkgsrc="${url##*/}-${_commit}"
source=(
  "${url}/archive/${_commit}/${_pkgsrc}.tar.gz"
)
sha256sums=('6c4b5174b116106b61c3f9487e4122947c0d62a028c0d433a3f92af1880dbe59')

build() {
  local configure_options=(
    --prefix='/usr'
  )

  cd "${srcdir}/${_pkgsrc}"
  autoreconf -vfi
  ./configure "${configure_options[@]}"
  make
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  make DESTDIR="${pkgdir}" install

  install -vDm644 "AUTHORS" "ChangeLog" "NEWS" "README" "REMARKS" \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -vDm644 "COPYING" "COPYRIGHT" \
    -t "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
