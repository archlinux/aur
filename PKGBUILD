# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="gjay"
pkgver=0.4
_commit="d05307507f6db603a9fb5ee702d3cddfd91894e1"
pkgrel=1
pkgdesc="DJ-friendly GUI for generating playlists across large music collections"
arch=('x86_64')
url="https://${pkgname}.sourceforge.net"
_url="https://github.com/csmall/${pkgname}"
license=('GPL-2.0-or-later')
makedepends=('libvorbis')
depends=('audacious' 'dbus-glib' 'flac' 'gdk-pixbuf2' 'glib2' 'glibc' 'gsl'
         'gtk2' 'libaudclient' 'libmpdclient' 'mpg321')
optdepends=('libvorbis: support .ogg files'
            'vorbis-tools: support .ogg files')
_pkgsrc="${pkgname}-${_commit}"
source=("${_pkgsrc}.tar.gz::${_url}/archive/${_commit}.tar.gz")
sha256sums=('3e16c1bc0281ceb932757807b7fdbda6065f2512cc534174eedaf4e618bc06ed')

pkgver() {
  cd "${srcdir}/${_pkgsrc}"
  sed -n 's/AC_INIT(\[[^]]*\],\[\([^]]*\)\].*/\1/p' configure.ac
}

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
