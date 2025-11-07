# Maintainer: grufo <madmurphy333 AT gmail DOT com>
# Contributor: TheJackiMonster <jacki AT thejackimonster DOT de>

_framework='gnunet'
pkgname='messenger-cli'
pkgver='0.4.0'
pkgrel=1
pkgdesc='A command line interface for GNUnet Messenger'
arch=('i686' 'x86_64' 'aarch64')
url="https://${_framework}.org"
license=('AGPL')
makedepends=('meson')
depends=("${_framework}" 'libgnunetchat' 'ncurses')
provides=("${pkgname}")
conflicts=("${pkgname}-git" "${pkgname}-bin")
source=("ftp://ftp.gnu.org/gnu/${_framework}/${pkgname}-${pkgver}.tar.gz"{,.sig})
sha256sums=('9ce0e8168aad3188c91875b13b9c991fd389d52c26f1d08de91cbbf4caf1406d'
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

