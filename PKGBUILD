# Maintainer: grufo <madmurphy333 AT gmail DOT com>
# Contributor: TheJackiMonster <jacki AT thejackimonster DOT de>

_framework='gnunet'
pkgname='messenger-gtk'
pkgver='0.10.0'
pkgrel=1
pkgdesc='A graphical user interface for GNUnet Messenger'
arch=('i686' 'x86_64')
url="https://${_framework}.org"
license=('AGPL')
makedepends=('meson')
depends=('gnunet' 'libgnunetchat' 'gtk3' 'libhandy' 'libnotify' 'qrencode'
         'zbar' 'gstreamer' 'libportal' 'libportal-gtk3' 'pipewire' 
		 'gst-plugin-pipewire' 'gst-plugin-gtk' 'gst-plugins-bad' 
		 'gst-plugins-base' 'gst-plugins-good')
conflicts=("${pkgname}-bin" "${pkgname}-git")
source=("https://ftp.gnu.org/gnu/${_framework}/${pkgname}-${pkgver}.tar.gz"{,.sig})
validpgpkeys=('3D11063C10F98D14BD24D1470B0998EF86F59B6A')
sha256sums=('b72afdd3d554a01ee08ca260940f782b7fa77748e80b02f932ab3fd8c8c4da91'
            'SKIP')

prepare() {
	cd "${pkgname}-${pkgver}"
	meson setup --prefix /usr --buildtype release build
}

build() {
	cd "${pkgname}-${pkgver}"
	meson compile -C build
}

package() {
	cd "${pkgname}-${pkgver}"
	DESTDIR="$pkgdir" meson install -C build
}

