# Maintainer: grufo <madmurphy333 AT gmail DOT com>
# Contributor: TheJackiMonster <jacki AT thejackimonster DOT de>

_framework='gnunet'
pkgname='libgnunetchat'
pkgver='0.5.3'
pkgrel=1
pkgdesc='GNUnet chat library'
arch=('i686' 'x86_64' 'aarch64')
url="http://${_framework}.org"
license=('AGPL')
conflicts=("${pkgname}-bin" "${pkgname}-git")
depends=("${_framework}")
makedepends=(meson check)
options=('!makeflags' '!buildflags')
source=("https://ftp.gnu.org/gnu/${_framework}/${pkgname}-${pkgver}.tar.gz"{,.sig})
validpgpkeys=('3D11063C10F98D14BD24D1470B0998EF86F59B6A')
sha256sums=('87d7f4a31dd9fd685d4d45ca037cdcef4cfef8b44661b1f7d34f8d8baa28ddb0'
            'SKIP')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	meson setup --prefix /usr --buildtype release build
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	meson compile -C build
}

#check() {
#	cd "${srcdir}/${pkgname}-${pkgver}"
#	meson test -C build
#}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	DESTDIR="$pkgdir" meson install -C build
}
