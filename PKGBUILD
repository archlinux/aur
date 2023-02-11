# Maintainer: grufo <madmurphy333 AT gmail DOT com>
# Contributor: TheJackiMonster <thejackimonster AT gmail DOT com>

_framework='gnunet'
pkgname='libgnunetchat'
pkgver=0.1.3
pkgrel=2
pkgdesc='GNUnet chat library'
arch=('i686' 'x86_64')
url="http://${_framework}.org"
license=('AGPL')
conflicts=("${pkgname}-bin" "${pkgname}-git")
depends=("${_framework}")
makedepends=(meson check)
options=('!makeflags' '!buildflags')
source=("https://ftp.gnu.org/gnu/${_framework}/${pkgname}-${pkgver}.tar.xz"{,.sig})
validpgpkeys=('3D11063C10F98D14BD24D1470B0998EF86F59B6A')
sha256sums=('fa5463290b18cb2615c61860c0b13d44d55ed0bb13e2b4cd3aa2a22559005e92'
            'SKIP')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	meson build
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	meson compile -C build
}

check() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	meson test -C build
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	DESTDIR="$pkgdir" meson install -C build
}
