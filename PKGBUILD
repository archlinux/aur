# Maintainer: MGislv <nocentinigabriele91@gmail.com>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=dmidiplayer
pkgver=1.5.3
pkgrel=1
pkgdesc='MIDI file player based on Drumstick'
arch=('x86_64')
url='https://sourceforge.net/projects/dmidiplayer/'
license=('GPL3')
depends=('drumstick' 'uchardet')
makedepends=('cmake' 'qt5-tools' 'pandoc')
source=("https://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('b4eefe41e43d99be2166e20ca238dd5c6d15e4d9b5d943fbadab877994efc739cafb36b4621092e9f092f0791b905e6eb77f569b683b7fa1be257179bdced6a0')

build() {
	cmake -B build \
	      -S "${pkgname}-${pkgver}" \
	      -DCMAKE_BUILD_TYPE=None \
	      -DCMAKE_INSTALL_PREFIX=/usr \
	      -DCMAKE_INSTALL_LIBDIR=lib \
	      -DBUILD_DOCS=ON
	make -C build
}

package() {
	make DESTDIR="${pkgdir}" -C build install
	install -Dm644 "${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
