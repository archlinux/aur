# Maintainer: Tom Gundersen <teg@jklm.no>
# Contributor: Hugo Doria <hugo@archlinux.org>
# Contributor: Sarah Hay <sarah@archlinux.org>
# Contributor: dorphell <dorphell@archlinux.org>

pkgname=faac
pkgver=1.30
pkgrel=1
pkgdesc="An AAC audio encoder"
arch=('x86_64')
url="https://www.audiocoding.com/"
license=('GPL' 'custom')
depends=('libmp4v2')
source=($pkgname-$pkgver.tar.gz::"https://github.com/knik0/faac/archive/${pkgver/./_}.tar.gz")
sha256sums=('adc387ce588cca16d98c03b6ec1e58f0ffd9fc6eadb00e254157d6b16203b2d2')

build() {
  cd ${pkgname}-${pkgver/./_}
  ./bootstrap
  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname}-${pkgver/./_}
  make DESTDIR="${pkgdir}" install

  install -Dm644 "${srcdir}"/${pkgname}-${pkgver/./_}/COPYING \
    "${pkgdir}"/usr/share/licenses/faac/LICENSE
}
