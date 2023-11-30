# Maintainer: hu3rror <hu3rror@protonmail.com>
# Contributor: ventusliberum <dafeinayius@gmail.com>

pkgname=wonderpen-bin
pkgver=2.4.1
_pkgver=7250
pkgrel=1
pkgdesc='A professional writing app with a focused mode and markdown support'
arch=('x86_64')
url='https://www.tominlab.com/en/wonderpen'
license=('custom')
depends=('libappindicator-gtk3' 'libnotify' 'libxss' 'nss' 'xdg-utils')
provides=('wonderpen')
source=("https://file.tominlab.com/WonderPen/${pkgver%.*}/WonderPen_linux_amd64_${pkgver}(${_pkgver}).deb")
sha256sums=('23ad8fcb8a7727004ca1bc10a5aa981859f65ed1ca0a69946a1a9dc4e28405f7')

package() {
	# Install
	cd "${srcdir}"
	tar -xJf data.tar.xz -C "${pkgdir}"
	install -dm755 "${pkgdir}"/usr/bin
	ln -s /opt/WonderPen/wonderpen "${pkgdir}"/usr/bin/wonderpen
	sed -i 's|^Exec=/opt/WonderPen/wonderpen %U|Exec=wonderpen %F|g' "${pkgdir}"/usr/share/applications/wonderpen.desktop
	install -Dm 644 "${pkgdir}"/usr/share/icons/hicolor/512x512/apps/wonderpen.png "${pkgdir}"/usr/share/pixmaps/wonderpen.png
}
