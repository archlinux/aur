# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=bolt
pkgver=0.3
pkgrel=1
pkgdesc="Thunderbolt 3 security system daemon"
arch=('i686' 'x86_64')
url="https://gitlab.freedesktop.org/bolt/bolt"
license=('LGPL')
depends=('polkit' 'systemd')
makedepends=('asciidoc' 'meson')
checkdepends=('umockdev')
source=($pkgname-$pkgver.tar.gz::https://gitlab.freedesktop.org/$pkgname/$pkgname/repository/$pkgver/archive.tar.bz2)
sha256sums=('c8ec4c77485fc11b4c5994c96838f38f9529816708cbdf35c00fcb495e5a587f')

build() {
  cd "${srcdir}"/$pkgname-$pkgver-0823d6ffd50be2854b23dbf75c30038acca2c047

  install -d ../build
  arch-meson ../build
  ninja -v -C ../build
}

check() {
  cd "${srcdir}"/$pkgname-$pkgver-0823d6ffd50be2854b23dbf75c30038acca2c047

  ninja -C ../build test
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver-0823d6ffd50be2854b23dbf75c30038acca2c047

  DESTDIR="${pkgdir}" ninja -C ../build install
# Fixup mode to match polkit
  install -d -o root -g 102 -m 750 "${pkgdir}/usr/share/polkit-1/rules.d"
}
