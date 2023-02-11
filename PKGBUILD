# Maintainer: grufo <madmurphy333 AT gmail DOT com>

_framework='gnunet'
pkgname='messenger-cli'
pkgver='0.1.1'
pkgrel=1
pkgdesc='A command line interface for GNUnet Messenger'
arch=('i686' 'x86_64')
url="https://${_framework}.org"
license=('AGPL')
makedepends=('meson')
depends=("${_framework}" 'libgnunetchat' 'ncurses')
provides=("${pkgname}")
conflicts=("${pkgname}-git" "${pkgname}-bin")
source=("ftp://ftp.gnu.org/gnu/${_framework}/${pkgname}-${pkgver}.tar.xz"{,.sig})
sha256sums=('8f667c005790263b27916a58f6aeb1e93279a1595d86e731e2229fa41013d68b'
            'SKIP')
validpgpkeys=('3D11063C10F98D14BD24D1470B0998EF86F59B6A')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	PKG_CONFIG_PATH="$PKG_CONFIG_PATH:/usr/local/lib/pkgconfig" meson build
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	meson compile -C build
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	DESTDIR="$pkgdir" meson install -C build
}

