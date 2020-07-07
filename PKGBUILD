# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: whisky <archlinux.cle(at)gmail.com>
# Contributor: damir <damir@archlinux.org>

pkgname=scim-chewing
pkgver=0.5.1
pkgrel=2
pkgdesc='Traditional Chinese input method module for SCIM'
url='http://chewing.im/'
license=('GPL')
arch=('x86_64')
makedepends=('intltool')
depends=('scim' 'libchewing')
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/chewing/scim-chewing/archive/v$pkgver.tar.gz")
sha256sums=('491b127784fa38734f3062fd57ea57e54f5f44d37b551ab25aab10c565cf6ebb')

prepare() {
  cd ${pkgname}-${pkgver}
  # ChangeLog is deprecated, but autotool expects one.
  touch ChangeLog
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
