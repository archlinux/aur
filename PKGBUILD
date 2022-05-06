# Maintainer: grufo <madmurphy333 AT gmail DOT com>
# Contributor: TheJackiMonster <thejackimonster AT gmail DOT com>

_framework='gnunet'
pkgname='messenger-gtk'
pkgver='0.7.0'
pkgrel=1
pkgdesc='A graphical user interface for GNUnet Messenger'
arch=('i686' 'x86_64')
url="https://gnunet.org"
license=('AGPL')
depends=('gnunet' 'libgnunetchat' 'gtk3' 'libhandy' 'libnotify' 'qrencode'
         'zbar' 'gstreamer')
conflicts=("${pkgname}-bin" "${pkgname}-git")
source=("https://ftp.gnu.org/gnu/${_framework}/${pkgname}-${pkgver}.tar.gz"{,.sig})
validpgpkeys=('3D11063C10F98D14BD24D1470B0998EF86F59B6A')
sha256sums=('b6ba577ca32766a52e8efddacd123e2390ca475ed8bd330336965989e61ff255'
            'SKIP')

build() {
	cd "${pkgname}-${pkgver}"
	make release
}

package() {
	cd "${pkgname}-${pkgver}"
	install -dm755 "${pkgdir}/usr/bin"
	make INSTALL_DIR="${pkgdir}/usr/" install

	# To be removed upstream...
	rm "${pkgdir}/usr/share/icons/hicolor/icon-theme.cache"
}

