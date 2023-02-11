# Maintainer: grufo <madmurphy333 AT gmail DOT com>
# Contributor: TheJackiMonster <thejackimonster AT gmail DOT com>

_framework='gnunet'
pkgname='messenger-gtk'
pkgver='0.8.0'
pkgrel=1
pkgdesc='A graphical user interface for GNUnet Messenger'
arch=('i686' 'x86_64')
url="https://${_framework}.org"
license=('AGPL')
makedepends=('meson')
depends=('gnunet' 'libgnunetchat' 'gtk3' 'libhandy' 'libnotify' 'qrencode'
         'zbar' 'gstreamer')
conflicts=("${pkgname}-bin" "${pkgname}-git")
source=("https://ftp.gnu.org/gnu/${_framework}/${pkgname}-${pkgver}.tar.xz"{,.sig})
validpgpkeys=('3D11063C10F98D14BD24D1470B0998EF86F59B6A')
sha256sums=('51dc35b6106eddc06a979289b610be7d31b0c74edbbce7c414a2f2c8ad6bb54b'
            'SKIP')

prepare() {
	cd "${pkgname}-${pkgver}"
	PKG_CONFIG_PATH="$PKG_CONFIG_PATH:/usr/local/lib/pkgconfig" meson build
}

build() {
	cd "${pkgname}-${pkgver}"
	meson compile -C build
}

package() {
	cd "${pkgname}-${pkgver}"
	DESTDIR="$pkgdir" meson install -C build
}

