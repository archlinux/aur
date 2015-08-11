# Maintainer: Christoph J. Thompson <thompsonc@protonmail.ch>

pkgname=gopherus
pkgver=1.0b
pkgrel=1
pkgdesc="Gopher client"
arch=('i686' 'x86_64')
url="http://gopherus.sourceforge.net"
license=('GPL3')
depends=('sdl2')
source=(http://downloads.sourceforge.net/project/${pkgname}/v${pkgver}/${pkgname}-${pkgver}.tar.gz
        gopherus.desktop)
sha256sums=(c8ec94fa7c9e042845dcb2b460a798d46b4e8374c432f1a830fcfc1a4838e556
            4126b4f4e292e531c0bcfd74f0f0b4eb38838e7c78e48822d1e85ccc872dc10d)

build() {
  cd "${pkgname}-${pkgver}"
  sed -i '/upx --best --lzma/d' Makefile.lin
  make -f Makefile.lin
}

package() {
  install -m 0755 -d "${pkgdir}/usr/share/applications"
  install -m 0644 gopherus.desktop "${pkgdir}/usr/share/applications"
  cd "${pkgname}-${pkgver}"
  install -m 0755 -d "${pkgdir}/usr/bin"
  install -m 0755 -s gopherus "${pkgdir}/usr/bin"
  install -m 0755 -d "${pkgdir}/usr/doc/${pkgname}"
  install -m 0644 gopherus.txt history.txt "${pkgdir}/usr/doc/${pkgname}"
  install -m 0755 -d "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
  install -m 0644 icon.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
}

