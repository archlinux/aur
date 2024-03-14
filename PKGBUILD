# Maintainer: grufo <madmurphy333 AT gmail DOT com>
# Contributor: TheJackiMonster <jacki AT thejackimonster DOT de>

_framework='gnunet'
pkgname='messenger-cli'
pkgver='0.2.0'
pkgrel=2
pkgdesc='A command line interface for GNUnet Messenger'
arch=('i686' 'x86_64')
url="https://${_framework}.org"
license=('AGPL')
makedepends=('meson')
depends=("${_framework}" 'libgnunetchat' 'ncurses')
provides=("${pkgname}")
conflicts=("${pkgname}-git" "${pkgname}-bin")
source=("ftp://ftp.gnu.org/gnu/${_framework}/${pkgname}-${pkgver}.tar.gz"{,.sig})
sha256sums=('66e19f959b0cccf678df46e837f2cab44b616b2cb2af1634b8821641ab14eef6'
            'SKIP')
validpgpkeys=('3D11063C10F98D14BD24D1470B0998EF86F59B6A')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	meson setup --prefix /usr --buildtype release build
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	meson compile -C build
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	DESTDIR="$pkgdir" meson install -C build
}

