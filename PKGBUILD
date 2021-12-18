# Maintainer: Alexander Epaneshnikov <alex19ep@archlinux.org>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: arjan <arjan@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk> and patched by orelien <aurelien.foret@wanadoo.fr>

pkgname=tuxtype
pkgver=1.8.3
pkgrel=2
pkgdesc="An educational typing tutorial game starring Tux"
arch=('x86_64')
url="https://www.tux4kids.com/tuxtyping.html"
license=('GPL2')
depends=('t4kcommon' 'sdl' 'sdl_image' 'sdl_mixer' 'sdl_pango' 'sdl_net')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tux4kids/tuxtype/archive/refs/tags/upstream/$pkgver.tar.gz")
sha256sums=('c1abea756ad8fa1e9217f9dea63e7de5fe536022c6984dc438c65d9a1afb92bb')

prepare() {
  cd ${pkgname}-upstream-${pkgver}
  NOCONFIGURE=1 autoreconf -i
}

build() {
  cd ${pkgname}-upstream-${pkgver}

  ./configure --prefix=/usr --localstatedir=/usr/share/games --sysconfdir=/etc --without-rsvg
  make
  make update-gmo
}

package() {
  cd ${pkgname}-upstream-${pkgver}

  make DESTDIR="${pkgdir}" install

  #icon + desktop files
  install -vDm644 $pkgname.desktop "${pkgdir}"/usr/share/applications/$pkgname.desktop
  install -vDm644 icon.png "${pkgdir}"/usr/share/pixmaps/$pkgname.png
}
