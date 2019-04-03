# Maintainer: Gaetan Bisson <bisson@archlinux.org
# Contributor: damir <damir@archlinux.org>

pkgname=scim-uim
pkgver=0.2.0
pkgrel=9
pkgdesc='UIM bridging input engine for SCIM'
url='https://github.com/scim-im/scim-uim'
license=('GPL')
depends=('scim' 'uim')
arch=('x86_64')
source=("https://downloads.sourceforge.net/sourceforge/scim/${pkgname}-${pkgver}.tar.gz"
        'fix-gcc43-build.patch'
        'uim-1.5.5-header.patch')
sha256sums=('457eb89f40dda70f813c0b401aaec8b397e7daa340d53136aba3b97407533e13'
            'a0ac1e2f68e20f7326b9ae67d025291b9b4d26942566e8f1431dd6efc4457638'
            '3334bca0581be9cf058a7f1bf8b0a8d85e2953718b79f722f70c6dbd5d0e96b8')

prepare() {
  cd ${pkgname}-${pkgver}
  patch -p1 -i ../fix-gcc43-build.patch
  patch -p1 -i ../uim-1.5.5-header.patch
}

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
