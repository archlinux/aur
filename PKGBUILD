# Maintainer: Jan Claussen <jan dot claussen10 at web dot de>
pkgname=webos-dev-manager
pkgver=1.8.2
pkgrel=1
pkgdesc="Easy tool to manage developer mode and sideload applications on your webOS TV"
arch=(x86_64)
url="https://github.com/webosbrew/dev-manager-desktop"
license=('GPL')
depends=("zlib")
options=(!strip)
source_x86_64=("webosbrew.png"
			   "webos-dev-manager.desktop"
			   "${pkgname}-${pkgver}.AppImage::https://github.com/webosbrew/dev-manager-desktop/releases/download/v${pkgver}/webos-dev-manager-${pkgver}.AppImage"
               "https://raw.githubusercontent.com/webosbrew/dev-manager-desktop/v${pkgver}/LICENSE"
)

noextract=("${pkgname}-${pkgver}.AppImage")

sha256sums_x86_64=('09ccc361b9f6ceee7613672dcbd46996432a283a1d94aa91bcd9aad4b3e7992d'
				   '5a250a2408e5672b191190c25c7a651114680002c7a45c69c5b87e12ba2daea5'
				   'cb496ffdf455f526c0f8b9c4472cf680e732e616d9938f22e03c51ad512b9105'
                   'SKIP')

package() {

	# Install AppImage and license
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}.AppImage" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/opt/${pkgname}/LICENSE"

    # Symlink executable
    mkdir -p "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${pkgname}"

    # Symlink license
    mkdir -p "${pkgdir}/usr/share/licenses/$pkgname"
    ln -s "/opt/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"

	# Install icon
	mkdir -p "$pkgdir/usr/share/pixmaps/"
    install -m 644 "$srcdir/webosbrew.png" "$pkgdir/usr/share/pixmaps/"

	# Install desktop file
	echo "install webos-dev-manager.desktop"
	mkdir -p "$pkgdir/usr/share/applications/"
	install -m 664 "$srcdir/webos-dev-manager.desktop" "$pkgdir/usr/share/applications/"
}
