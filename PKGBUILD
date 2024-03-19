# Maintainer: Axel McLaren <scm(at)axml(dot)uk>
# Contributor: Yusuf Aktepe <yusuf@yusufaktepe.com>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: totoloco <totoloco at gmx>

pkgname=tabbed
pkgver=0.8
pkgrel=1
pkgdesc='simple generic tabbed frontend to xembed-aware applications'
arch=('x86_64')
url='https://tools.suckless.org/tabbed'
license=('custom:MIT/X')
depends=('libx11' 'libxft')
install='tabbed.install'
source=("https://dl.suckless.org/tools/${pkgname}-${pkgver}.tar.gz"
        'config.h')
sha256sums=('95bdffccb071083068d2b555c2524e9c7c57c9b64494d46c697e678d49a0a3d7'
            '2eb768bcf6474522b7765643318cb6b0178f3ad92fec3c869403db99b1a8cbaa')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  cp "${srcdir}/config.h" config.h

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make PREFIX=/usr DESTDIR="${pkgdir}" install
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
