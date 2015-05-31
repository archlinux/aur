# Maintainer: Robert Knauer <robert@privatdemail.net>
# Contributor: twa022 <twa022@gmail.com>

pkgname=audiothumbnailer
pkgver=0.2.0
pkgrel=3
pkgdesc="Lightweight audio thumbnailer that can be used by file managers"
url="http://code.google.com/p/audiothumbnailer/"
license=('GPL2')
arch=('i686' 'x86_64')
depends=('imagemagick' 'taglib')
source=(
  "http://${pkgname}.googlecode.com/files/${pkgname}-${pkgver}.tar.gz"
  "${pkgname}.cpp.patch"
)
sha256sums=(
  '1706f78e51be698ce4194dfe4fdff50ae07440d3e51d9e1ae4d367a5a8c2085c'
  '26447c4e29d94702af5939613af6153a6bc80b41157f330454db153a1d2463f7'
)
options=(!libtool)

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}/src"
  patch "${pkgname}.cpp" "${srcdir}/${pkgname}.cpp.patch"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
