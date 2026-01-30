# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="gjay"
_commit_rel="bbce54f744f81c782bb7db9606993e06858f94b3" # 0.4
_commit="9df02799e62e7c3da3bb087cda976ed7accbfdd9" # r7
pkgver="0.4+r7+g${_commit::7}"
pkgrel=2
pkgdesc="DJ-friendly GUI for generating playlists across large music collections"
arch=(
  'x86_64'
)
url="https://${pkgname}.sourceforge.net"
_url="https://github.com/csmall/${pkgname}"
license=(
  'GPL-2.0-or-later'
)
depends=(
  'dbus-glib'
  'flac'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gsl'
  'gtk2'
  'libaudclient'
  'mpg123'
)
makedepends=(
  'audacious'
  'libmpdclient'
  'libvorbis'
)
optdepends=(
  'audacious: small and fast audio player which supports lots of formats'
  'libmpdclient: Music Player Daemon'
  'vorbis-tools: support .ogg files'
)
_pkgsrc="${_url##*/}-${_commit}"
source=(
  "${_url}/archive/${_commit}/${_pkgsrc}.tar.gz"
)
sha256sums=('bc84d87c057a1da15c94909f36b4015604e48b6f1e41ba151a0326ac8d201538')

build() {
  export CFLAGS+=" -std=gnu17"

  cd "${srcdir}/${_pkgsrc}"
  ./autogen.sh
  ./configure \
    --prefix='/usr'
  make
}

# check() {
#   cd "${srcdir}/${_pkgsrc}"
#   make check
# }

package() { 
  cd "${srcdir}/${_pkgsrc}"
  make DESTDIR="${pkgdir}" install

  install -vDm644 "AUTHORS"   "${pkgdir}/usr/share/doc/${pkgname}/AUTHORS"
  install -vDm644 "ChangeLog" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG"
  install -vDm644 "README"    "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -vDm644 "COPYING"   "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
