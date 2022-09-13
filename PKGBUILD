# Contributor: Robert Knauer <robert@privatdemail.net>
# Contributor: twa022 <twa022@gmail.com>

pkgname=audiothumbnailer
pkgver=0.2.0
pkgrel=4
pkgdesc="Lightweight audio thumbnailer that can be used by file managers"
url="http://code.google.com/p/audiothumbnailer/"
license=('GPL2')
arch=('i686' 'x86_64')
depends=('imagemagick' 'taglib')
source=(
  "https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/audiothumbnailer/audiothumbnailer-0.2.0.tar.gz"
  "${pkgname}.cpp.patch"
)
sha256sums=(
  '1706f78e51be698ce4194dfe4fdff50ae07440d3e51d9e1ae4d367a5a8c2085c'
  '84771d5b964650dccb5814c30f788d67619a937f1143c42f14249a67b4eb2d72'
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
