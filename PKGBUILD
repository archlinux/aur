# Maintainer: Thomas Ascher <thomas.ascher@gmx.at>
# Contributor: Thomas Ascher <thomas.ascher@gmx.at>
pkgname=joyce
pkgrel=1
pkgver=2.4.2
pkgdesc="Emulates the Amstrad PCW on Unix"
arch=('i686' 'x86_64')
url="http://www.seasip.info/Unix/Joyce/index.html"
license=('GPL')
depends=('libpng'
         'libxml2'
         'sdl')
source=("http://www.seasip.info/Unix/Joyce/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}.desktop")
sha256sums=('85659a6ac9b94fdf78c28d5d8d65a4f69e7520e1c02a915b971c2754695ab82c'
            'ac4f54be832ff4c3bf434f36c0b28298742b20e4b6051db0a66e57ba636c5a98')

build() {
  cd "${pkgname}-${pkgver}"
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
