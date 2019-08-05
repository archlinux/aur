# Maintainer: pezcurrel <pezcurrel@tiscali.it>
# Contributor: Eric Bélanger <eric@archlinux.org>
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>

pkgname=geeqie-lirc
_upstreampkgname=geeqie
pkgver=1.5
pkgrel=1
pkgdesc='Lightweight image browser and viewer with LIRC support'
arch=('x86_64')
url='http://www.geeqie.org/'
license=('GPL2')
depends=('exiv2' 'gtk2' 'ffmpegthumbnailer' 'lirc')
makedepends=('intltool' 'doxygen' 'gnome-doc-utils' 'python')
optdepends=('librsvg: SVG rendering'
	    'fbida: for jpeg rotation')
conflicts=('geeqie' 'geeqie-git')
source=("http://www.geeqie.org/${_upstreampkgname}-${pkgver}.tar.xz" 'geeqie-no-changelog.patch')
sha256sums=('9736c8cbf21cc39d0a9c720934cdd33fe2756dc903c2a12cfc78b8822d2d1bf5'
            'f6eb2725a47fc750d95455d4bbf4be5a0ae45307d3ada571937212a25b2b4301')

prepare() {
  cd "${srcdir}/${_upstreampkgname}-${pkgver}"
  patch -p1 -i ../geeqie-no-changelog.patch # Workaround missing changelog (Fedora)
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd "${srcdir}/${_upstreampkgname}-${pkgver}"
  ./configure --prefix=/usr --disable-lua --enable-lirc
  make
}

package(){
  cd "${srcdir}/${_upstreampkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
