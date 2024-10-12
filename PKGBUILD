# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="gjay"
pkgver=0.4+r7+g9df0279
_commit="9df02799e62e7c3da3bb087cda976ed7accbfdd9"
pkgrel=1
pkgdesc="DJ-friendly GUI for generating playlists across large music collections"
arch=('x86_64')
url="https://${pkgname}.sourceforge.net"
_url="https://github.com/csmall/${pkgname}"
license=('GPL-2.0-or-later')
makedepends=('audacious' 'libmpdclient' 'libvorbis')
depends=('dbus-glib' 'flac' 'gdk-pixbuf2' 'glib2' 'glibc' 'gsl' 'gtk2'
         'libaudclient' 'mpg123')
optdepends=('audacious: small and fast audio player which supports lots of formats'
            'libmpdclient: Music Player Daemon'
            'vorbis-tools: support .ogg files')
_pkgsrc="${pkgname}-${_commit}"
source=("${_pkgsrc}.tar.gz::${_url}/archive/${_commit}.tar.gz")
sha256sums=('bc84d87c057a1da15c94909f36b4015604e48b6f1e41ba151a0326ac8d201538')

build() {
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

  install -Dm644 "README"    "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -Dm644 "ChangeLog" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG"
  install -Dm644 "COPYING"   "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  install -Dm644 "AUTHORS"   "${pkgdir}/usr/share/licenses/${pkgname}/AUTHORS"
}
