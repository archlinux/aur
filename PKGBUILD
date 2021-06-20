# Maintainer: Matteo Bonora <bonora.matteo@gmail.com>
# Contributor: Grigoris Pavlakis (aur.archlinux.org/account/lightspot21)
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Nick B <Shirakawasuna at gmail _dot_ com>
# Contributor: Dany Martineau <dany.luc.martineau at gmail.com>

pkgname=viruskiller
pkgver=1.03
pkgrel=3
pkgdesc="An arcade shoot 'em up game about virus invasion"
arch=('i686' 'x86_64')
url="http://www.happypenguin.org/show?Virus%20Killer"
license=('GPL')
depends=('gcc-libs' 'hicolor-icon-theme' 'sdl_image' 'sdl_mixer' 'sdl_net' 'sdl_ttf')
install="${pkgname}.install"
source=("https://ftp.lysator.liu.se/pub/opensuse/source/tumbleweed/repo/oss/src/${pkgname}-${pkgver}-2.12.src.rpm"
        "${pkgname}.patch"
	"fix-warnings.patch")
sha256sums=('456fa53eeed954a2528e7c2580970e1871aff8926be784ac0ad41a0477d00cb6'
            '1aa8f806bf15737404e71f94d0b3d7b170d52484c1618c36374433963441e642'
	    'e6d35b7c288e120055823f97df17e2c4f575bcf77899ff346e9ba1fdfde6cdbf')

prepare() {
  bsdtar -xf "${pkgname}-${pkgver}-2.12.src.rpm"
  bsdtar -xf "${pkgname}-${pkgver}.tar.gz"
}


build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Np1 -i "../${pkgname}.patch"
  patch -Np1 -i "../fix-warnings.patch"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
