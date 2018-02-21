# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Doug Newgard <scimmia at archlinux dot info>

pkgname=rage
pkgver=0.3.0
pkgrel=1
pkgdesc="Video Player based on EFL"
arch=('i686' 'x86_64')
url="https://www.enlightenment.org/about-rage"
license=('BSD')
depends=('efl')
makedepends=('meson' 'mesa')
source=("http://download.enlightenment.org/rel/apps/${pkgname}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('1e772370c2199f89f4c34f1968432df4eabf0e4fe4f960649d0b9d27496bdf3d')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  meson --prefix /usr --buildtype release build
  ninja -C build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  DESTDIR="${pkgdir}" ninja -C build install

  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}/" "README"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" "AUTHORS" "COPYING"
}
