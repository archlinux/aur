# Maintainer:  Andrew O'Neill <andrew at meanjollies dot com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Eric Belanger <belanger@astro.umontreal.ca>
# Contributor: Ravi Desai <ravster3@hotmail.com>

pkgname=xfe
pkgver=1.42
pkgrel=4
pkgdesc='X File Explorer (Xfe) is an MS-Explorer like file manager for X.'
arch=('x86_64')
url='http://roland65.free.fr/xfe'
license=('GPL')
depends=('fox>=1:1.6' 'fox<1:1.7' 'freetype2')
makedepends=('intltool')
source=("https://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}.patch")
sha256sums=('a1e3e892584988c80b3a492f7b3cb78e1ee84d7148e6d1fc9d6054bbd8063bec'
            '5a364fc784c993ce2551a3c69933d3f4e227ea9f0511f2f5865e852c5a7f5bf0')

prepare() {
  cd "${pkgname}-${pkgver}"
  patch -p1 < ../${pkgname}.patch 
}

build() {
  cd "${pkgname}-${pkgver}"
  ./autogen.sh 
  ./configure --prefix=/usr 
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
