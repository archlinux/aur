# Maintainer: Yusuf Aktepe <yusuf@yusufaktepe.com>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
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
sha256sums=('7651ea3acbec5d6a25469e8665da7fc70aba2b4fa61a2a6a5449eafdfd641c42'
            'b53a40916d44090c31cdf5b259336deb70b79d15888f6941e7b8d216370cda55')

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
