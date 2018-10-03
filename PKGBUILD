# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributor: whisky <archlinux.cle(at)gmail.com>
# Contributor: damir <damir@archlinux.org>

pkgname=scim-chewing
pkgver=0.3.5
pkgrel=4
pkgdesc='Traditional Chinese input method module for SCIM'
url='http://chewing.im/'
license=('GPL')
arch=('x86_64')
makedepends=('intltool')
depends=('scim' 'libchewing')
source=("https://github.com/chewing/scim-chewing/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.bz2" 
        scim-chewing-libchewing04.patch)
sha256sums=('e7ae2356a6ca11c342795e3a14ad7667f76a0af4be23e01ea60acc6d4af72d64'
            '0dd0ecc6b4f03b599dec97812a7c4534a9edca0243477222a87cd75da74d1c93')

prepare() {
  cd ${pkgname}-${pkgver}
  patch -p1 -i ../scim-chewing-libchewing04.patch # Fix build with libchewing 0.4 (Fedora)
  autoreconf -vfi
  intltoolize --force
}

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
