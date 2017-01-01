# Maintainer: Thomas Ascher <thomas.ascher@gmx.at>
# Contributor: Thomas Ascher <thomas.ascher@gmx.at>
pkgname=joyce
pkgrel=1
pkgver=2.2.10
pkgdesc="Emulates the Amstrad PCW on Unix"
arch=('i686' 'x86_64')
url="http://www.seasip.info/Unix/Joyce/index.html"
license=('GPL')
depends=('libpng'
         'libxml2'
         'sdl')
makedepends=('lyx')
source=("http://www.seasip.info/Unix/Joyce/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}.desktop")
sha256sums=('8ce633278c438c9228c9201c8e2522cd32cc92a6f868a8b8e580e917c5fb2144'
            'ac4f54be832ff4c3bf434f36c0b28298742b20e4b6051db0a66e57ba636c5a98')

build() {
  cd "${pkgname}-${pkgver}"
  #patch -Np1 -i "${srcdir}/type_cast_fix.patch"
  ./configure --prefix=/usr --enable-shared
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
  install -D -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}

post_install() {
  update-desktop-database -q
}

post_upgrade() {
  post_install $1
}

post_remove() {
  post_install $1
}
