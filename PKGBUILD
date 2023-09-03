# Maintainer: Vlad Glagolev <scm(at)vaygr(dot)net>
# Contributor: Yusuf Aktepe <yusuf@yusufaktepe.com>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: totoloco <totoloco at gmx>

pkgname=tabbed
pkgver=0.7
pkgrel=3
pkgdesc='simple generic tabbed frontend to xembed-aware applications'
arch=('x86_64')
url='https://tools.suckless.org/tabbed'
license=('custom:MIT/X')
depends=('libx11' 'libxft')
install='tabbed.install'
source=("https://dl.suckless.org/tools/${pkgname}-${pkgver}.tar.gz"
        'config.h')
sha256sums=('6e8682230a213d7dabf8a79306bd3ce023875b2295a9097db427d65c1c68f322'
            '2eb768bcf6474522b7765643318cb6b0178f3ad92fec3c869403db99b1a8cbaa')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  cp "${srcdir}/config.h" config.h

  sed -i 's/CPPFLAGS =/CPPFLAGS +=/g' config.mk
  sed -i 's/CFLAGS =/CFLAGS +=/g' config.mk
  sed -i 's/LDFLAGS =/LDFLAGS +=/g' config.mk
  sed -i '/xembed.1/d' Makefile

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make PREFIX=/usr DESTDIR="${pkgdir}" install
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
