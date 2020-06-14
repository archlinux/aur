# Maintainer: Thomas Ascher <thomas.ascher@gmx.at>
# Contributor: Thomas Ascher <thomas.ascher@gmx.at>
pkgname=joyce
pkgrel=1
pkgver=2.2.13
pkgdesc="Emulates the Amstrad PCW on Unix"
arch=('i686' 'x86_64')
url="http://www.seasip.info/Unix/Joyce/index.html"
license=('GPL')
depends=('libpng'
         'libxml2'
         'sdl')
source=("http://www.seasip.info/Unix/Joyce/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}.desktop")
sha256sums=('25d1d5b2543b2d09d2179c6292aad04777a5d9323eb3a8aadbf5b989fb51b179'
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
