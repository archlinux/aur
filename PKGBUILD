# Maintainer: zjuyk <ownbyzjuyk@gmail.com>

pkgname=koodo-reader-bin
_pkgname=Koodo.Reader
_pkgname2=koodo-reader
pkgver=1.5.2
pkgrel=1
pkgdesc="A cross-platform ebook reader"
arch=("x86_64")
url="https://koodo.960960.xyz/"
license=('AGPL-3.0')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'python-atspi' 'util-linux-libs' 'libappindicator-gtk3' 'libsecret')
provides=("koodo-reader")
source=("$pkgname-$pkgver.deb::https://github.com/troyeguo/${_pkgname2}/releases/download/v$pkgver/${_pkgname}-$pkgver.deb"
        "${_pkgname2}.desktop")
sha256sums=('b47a57562d58ed3c537c22fd096cf59d1b5bc59ac348c19cd6ab5f8c7422e513'
            '9fd70a6316a1fd9369bd1c1c0b1b6583da0eed85502804deea2042b4a38aaa0e')

prepare() {
	cd ${srcdir}
	tar -Jxvf data.tar.xz -C "${srcdir}"
}

package() {
	cd ${srcdir}
	
	mkdir -p ${pkgdir}/opt/${pkgname}
	mv opt/'Koodo Reader'/* ${pkgdir}/opt/${pkgname}/

	mkdir -p "${pkgdir}"/usr/bin
	ln -s /opt/${pkgname}/koodo-reader "${pkgdir}"/usr/bin/koodo-reader

	install -Dm644 ${_pkgname2}.desktop -t ${pkgdir}/usr/share/applications/

	install -Dm644 ${srcdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname2}.png ${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname2}.png

}
