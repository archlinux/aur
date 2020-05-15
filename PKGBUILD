# Maintainer: Syaoran Code <syaorancode@gmail.com>
pkgname=libxft-bgra-git
_dir=libxft-bgra
pkgver=1.0
pkgrel=1
pkgdesc="libXft with BGRA glyph (color emoji) rendering & scaling patches"
arch=('x86_64')
license=('custome')
groups=('modified')
provides=('libxft')
conflicts=('libxft')
url="https://github.com/justanoobcoder/libxft-bgra.git"
depends=('fontconfig' 'libxrender')
makedepends=('git' 'pkgconfig')
source=(${url}/releases/individual/lib/libXft-${_pkgbasever}.tar.bz2{,.sig})

pkgver() {
    cd "${_dir}"
    printf "%s.r%s.%s" "$(awk '/^Version/ {print $2}' NEWS | head -1)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_dir}"
  ./autogen.sh --sysconfdir=/etc --prefix=/usr --mandir=/usr/share/man --disable-static
  make
}

package() {
  cd "${_dir}"
  make DESTDIR="${pkgdir}" install
  install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
