# Maintainer: Masanori Ohgita <mp_aur[at]ohgita[dot]info>
pkgname=maixpy-ide
pkgver=0.2.3
pkgrel=2
pkgdesc="Micropython env for Sipeed Maix boards"
url="https://github.com/sipeed/MaixPy"
arch=('x86_64')
license=('Apache')
depends=('libusb' 'python-pyusb' 'qt5-multimedia' 'qt5-script' 'qt5-svg' 'qt5-tools' 'qt5-webengine' 'qt5-3d')
builddepends=()
source=(
	"http://dl.sipeed.com/MAIX/MaixPy/ide/v${pkgver}/maixpy-ide-linux-x86_64-${pkgver}-installer-archive.7z"
)
sha256sums=(
	'a04cedfe656781230d9ce0340e87afa86cc3d35e1fca7e1dfbd1f4f901ada161'
)
install=maixpy-ide.install

package() {

	cd "${srcdir}"

	# Install the application to /opt/maixpy-ide/
	mkdir -p "${pkgdir}/opt/${pkgname}/"
	cp -a share/ "${pkgdir}/opt/${pkgname}/"
	cp -a lib/ "${pkgdir}/opt/${pkgname}/"
	cp -a bin/ "${pkgdir}/opt/${pkgname}/"
	cp -a README.txt "${pkgdir}/opt/${pkgname}/"
	chmod 755 "${pkgdir}/opt/${pkgname}/bin/maixpyide.sh"

	# Add the symbolic link to /usr/bin/
	mkdir -p "${pkgdir}/usr/bin/"
	ln -s "/opt/${pkgname}/bin/maixpyide.sh" "${pkgdir}/usr/bin/${pkgname}"

	# Add the desktop entry
	mkdir -p "${pkgdir}/usr/share/applications/"
	install -Dm644 "../${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

}
