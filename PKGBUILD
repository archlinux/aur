pkgname=vk-desktop-messenger
pkgver=1.2.0
pkgrel=1
pkgdesc="VK Desktop Messenger"
arch=(i686 x86_64)
url="https://vk.com/messenger"
license=('custom')
depends=('alsa-lib' 'expat' 'gconf' 'gtk2' 'libgcrypt' 'libgnome-keyring' 'libnotify' 'libxss' 'libxtst' 'nss' 'xdg-utils')
optdepends=('gnome-keyring')
source_i686=("https://desktop.userapi.com/linux32/master/vk.zip")
source_x86_64=("https://desktop.userapi.com/linux64/master/vk.zip")

source+=('vk-desktop-messenger.desktop')

sha256sums_i686=('SKIP')
sha256sums_x86_64=('SKIP')

noextract=('vk.zip')

sha256sums+=('f9b3f92a194bab05b184cc955b930395a95866d38342c70e35285833ef9ed9fb')

package() {
	install -Dm644 "${srcdir}/vk-desktop-messenger.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -dm755 "${pkgdir}/usr/lib/vk"
	install -dm755 "${pkgdir}/usr/bin"

	bsdtar -xf "${srcdir}/vk.zip" -C "${pkgdir}/usr/lib/vk"
    install -Dm644 "${pkgdir}/usr/lib/vk/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    ln -s "${pkgdir}/usr/lib/vk/vk" "${pkgdir}/usr/bin/vk"

    sed -i 's/"updates": 1/"updates": 0/g' "${pkgdir}/usr/lib/vk/resources/app/package.json"
    sed -i '/custom_install/d' "${pkgdir}/usr/lib/vk/resources/app/package.json"
}
