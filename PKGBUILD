# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: totoloco <totoloco at gmx>

pkgname=tabbed
pkgver=0.6
pkgrel=3
pkgdesc='Simple generic tabbed fronted to xembed aware applications.'
arch=('x86_64')
url='https://tools.suckless.org/tabbed'
license=('custom:MIT/X')
depends=('libx11')
install='tabbed.install'
source=("https://dl.suckless.org/tools/${pkgname}-${pkgver}.tar.gz"
        'config.h')
md5sums=('7898992feb9358e0196119750b77b42c'
         '910b1cbcf62051064c58029987e05db8')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  cp "${srcdir}/config.h" config.h

  sed -i 's/CPPFLAGS =/CPPFLAGS +=/g' config.mk
  sed -i 's/CFLAGS =/CFLAGS +=/g' config.mk
  sed -i 's/LDFLAGS =/LDFLAGS +=/g' config.mk

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make PREFIX=/usr DESTDIR="${pkgdir}" install
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
