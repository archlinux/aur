# Maintainer: hu3rror <hu3rror@protonmail.com>
# Contributor: ventusliberum <dafeinayius@gmail.com>

pkgname=wonderpen-bin
pkgver=2.6.8
_pkgver=7816
pkgrel=1
pkgdesc='A professional writing app with a focused mode and markdown support'
arch=('x86_64')
url='https://www.tominlab.com/en/wonderpen'
license=('custom')
depends=('libappindicator-gtk3' 'libnotify' 'libxss' 'nss' 'xdg-utils')
provides=('wonderpen')
source=("https://file.tominlab.com/WonderPen/${pkgver%.*}/WonderPen_linux_amd64_${pkgver}(${_pkgver}).deb")
sha256sums=('f3579b2fca14ca0766cd7e63b5c92a66927d56551f5d271d393323f97882f072')

package() {
	# Install
	cd "${srcdir}"
	tar -xJf data.tar.xz -C "${pkgdir}"
	install -dm755 "${pkgdir}"/usr/bin
	ln -s /opt/WonderPen/wonderpen "${pkgdir}"/usr/bin/wonderpen
	sed -i 's|^Exec=/opt/WonderPen/wonderpen %U|Exec=wonderpen %F|g' "${pkgdir}"/usr/share/applications/wonderpen.desktop
	install -Dm 644 "${pkgdir}"/usr/share/icons/hicolor/512x512/apps/wonderpen.png "${pkgdir}"/usr/share/pixmaps/wonderpen.png
}