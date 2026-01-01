# Maintainer: Ateles
# Previous maintainer: undevdecatos
# Contributor: Gavin Lloyd <gavinhungry@gmail.com>
# Contributor: Tomas Kramar <kramar[dot]tomas[at]gmail[dot]com>

pkgname=hdaps-gl
pkgver=0.0.7
pkgrel=2
pkgdesc='ThinkPad HDAPS OpenGL monitor'
arch=('i686' 'x86_64')
url='http://hdaps.sourceforge.net'
license=('GPL2')
depends=('freeglut')
makedepends=('glu')
source=("https://github.com/linux-thinkpad/hdaps-gl/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('2c75100929876ba0b9a671853da73957b8d49bfc2c93bcc53f11e3fb9eadb035')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  autoreconf --force --install
  ./configure
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" prefix=/usr install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
